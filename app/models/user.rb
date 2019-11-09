# frozen_string_literal: true

require 'open-uri'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]
  # validates :name, presence:true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true
  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :reactions

  has_many :friendships, -> { where friendship_status: true }, foreign_key: 'requestor_id', dependent: :destroy
  has_many :inverse_friendships, -> { where friendship_status: true }, foreign_key: 'requested_id', class_name: 'Friendship'
  has_many :followers, through: :friendships, source: 'requested'
  has_many :followeds, through: :inverse_friendships, source: 'requestor'
  has_many :pending_requests, -> { where friendship_status: nil }, foreign_key: 'requested_id', source: 'requested', class_name: 'Friendship'
  has_many :pending_friends, through: :pending_requests, source: 'requestor'

  def friends
    ids = followeds.pluck(:id) + followers.pluck(:id)
    User.where(id: ids)
  end

  def send_friend_request(user)
    friendships.build(requested_id: user.id, friendship_status: nil).save if id != user.id
  end

  def friend_requested?(user)
    user.pending_requests.pluck(:requestor_id).include?(id)
  end

  def accept_friend_request(user)
    pending_requests.where(requestor_id: user.id).update(friendship_status: true)
  end

  def deny_friend_request(user)
    pending_requests.where(requestor_id: user.id).delete_all
  end

  def unfriend(user)
    table = friendships.where(requested_id: user.id).or(inverse_friendships.where(requestor_id: user.id)).ids
    Friendship.delete(table.first)
  end

  def we_are_friends?(friend)
    friends.include?(friend)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name.split.first # assuming the user model has a name
      download_image = open(auth.info.image) # assuming the user model has an image
      user.avatar.attach(io: download_image, filename: 'avatar.jpg', content_type: download_image.content_type)
    end
  end
end
