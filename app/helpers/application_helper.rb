# frozen_string_literal: true

module ApplicationHelper
  def friends_request_number
    current_user.friend_requests.size
  end

  def set_name
    if current_user.username != nil
      return current_user.username
    else
      return current_user.name
    end
  end
end
