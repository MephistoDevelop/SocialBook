# frozen_string_literal: true

class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user,presence:true
end
