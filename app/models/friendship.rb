# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :requestor, class_name: 'User'
  belongs_to :requested, class_name: 'User'

  def user_requestor
    User.where(id: requestor_id)
  end

  def user_requested
    User.where(id: requested_id)
  end
end
