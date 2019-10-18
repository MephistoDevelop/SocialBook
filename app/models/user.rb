# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :name, presence:true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  has_many :posts
  has_many :comments, foreign_key: 'author_id'
  has_many :reactions
  has_many :friends, class_name: 'User', foreign_key: 'friend_id'
  has_many :friendships, foreign_key: 'requestor_id'
  has_many :requesteds, through: :friendships, foreign_key: 'requested_id'

  def send_friend_request(user)
    self.friendships.build(requested_id: user.id).save
  end

  def accept_friend_request(user)
    friend_requests.where(requestor_id: user.id).update(friendship_status: true)
    self.friends << user
    user.friends << self
  end

  def deny_friend_request(user)
    friend_requests.where(requestor_id: user.id).delete_all
  end

  def friend_requests
    Friendship.where(requested_id: self.id)
  end

  #def friends
    #Friendship.where(["requested_id = ? and friendship_status = ? or requestor_id = ? and friendship_status = ?", self.id, 'true', self.id])
  #end
end
