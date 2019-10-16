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

  def total_likes
    self.likes - self.dislikes
  end

end
