# frozen_string_literal: true

class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 1000 }
  belongs_to :user

  has_many :comments
  has_many :reactions

  def number_of_reactions
    self.reactions.size
  end

  def likes
    self.reactions.where(["user_reaction = ?", "Like"]).size
  end

  def dislikes
    self.reactions.where(["user_reaction = ?", "Dislike"]).size
  end

  def total_reactions
    self.likes - self.dislikes
  end

  def add_like(user)
    self.reactions << user.reactions.create(user_reaction: "Like")
  end

  def add_dislike(user)
    self.reactions << user.reactions.create(user_reaction: "Dislike")
  end

end
