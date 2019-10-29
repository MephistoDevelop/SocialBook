# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :name, presence:true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  has_many :posts, dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :reactions

  has_many :friendships,-> {where friendship_status: true}, foreign_key: 'requestor_id', dependent: :destroy
  has_many :inverse_friendships,-> {where friendship_status: true}, foreign_key: 'requested_id', class_name: 'Friendship'
  has_many :followers, through: :friendships, source: 'requested'
  has_many :followeds, through: :inverse_friendships, source: 'requestor'
  has_many :pending_requests, -> {where friendship_status: nil}, foreign_key: 'requested_id', source: 'requested', class_name: 'Friendship'
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
    f = Friendship.where(friendship_status: true)
    q = f.where(requested_id: id).or(f.where(requestor_id: id))
    !q.where(requested_id: friend.id).or(f.where(requestor_id: friend.id)).map(&:friendship_status).empty?
  end
end
