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
  has_many :friendships, foreign_key: 'requestor_id', dependent: :destroy
  has_many :requesteds, through: :friendships, foreign_key: 'requested_id', dependent: :destroy

  def send_friend_request(user)
    friendships.build(requested_id: user.id).save if id != user.id
  end

  def friend_requested?(user)
    user.friend_requests.pluck(:requestor_id).include?(id)
  end

  def accept_friend_request(user)
    friend_requests.where(requestor_id: user.id).update(friendship_status: true)
  end

  def deny_friend_request(user)
    friend_requests.where(requestor_id: user.id).delete_all
  end

  def friend_requests
    Friendship.where(requested_id: id, friendship_status: nil)
  end

  def unfriend(user)
    row = friends.where(requested_id: user.id).or(friends.where(requestor_id: user.id))
    Friendship.delete(row.ids)
  end

  def friends
    f = Friendship.where(friendship_status: true)
    f.where(requested_id: id).or(f.where(requestor_id: id))
  end

  def we_are_friends?(friend)
    f = Friendship.where(friendship_status: true)
    q = f.where(requested_id: id).or(f.where(requestor_id: id))
    !q.where(requested_id: friend.id).or(f.where(requestor_id: friend.id)).map(&:friendship_status).empty?
  end
end
