# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :content, presence: true
  validates :author_id, presence: true

  def author
    User.where(id: author_id).first
  end
end
