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
    self.reactions.size
  end

  def add_like(user)
    self.reactions << user.reactions.create(user_reaction: 'Like')
  end

  def user_reacted?(user)
    !self.reactions.where(user_id: user.id).empty?
  end

  def destroy_reaction(user)
      self.reactions.where(user_id: user.id).destroy_all
  end
end
