# frozen_string_literal: true

class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 1000 }
  belongs_to :user

  has_many :comments
  has_many :reactions

  default_scope { order(created_at: :desc)}
  def likes
    reactions.size
  end

  def add_like(user)
    reactions << user.reactions.create(user_reaction: 'Like')
  end

  def user_reacted?(user)
    !reactions.where(user_id: user.id).empty?
  end

  def destroy_reaction(user)
    reactions.where(user_id: user.id).delete_all
  end
end
