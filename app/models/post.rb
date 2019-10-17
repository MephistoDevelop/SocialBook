# frozen_string_literal: true

class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 1000 }
  belongs_to :user

  has_many :comments
  has_many :reactions

  def number_of_reactions
    reactions.size
  end

  def likes
    reactions.where(['user_reaction = ?', 'Like']).size
  end

  def dislikes
    reactions.where(['user_reaction = ?', 'Dislike']).size
  end

  def total_reactions
    likes - dislikes
  end

  def add_like(user)
    reactions << user.reactions.create(user_reaction: 'Like')
  end

  def add_dislike(user)
    reactions << user.reactions.create(user_reaction: 'Dislike')
  end
end
