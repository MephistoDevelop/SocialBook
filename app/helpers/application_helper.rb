# frozen_string_literal: true

module ApplicationHelper
  def friends_request_number
    current_user.friend_requests.size
  end
end
