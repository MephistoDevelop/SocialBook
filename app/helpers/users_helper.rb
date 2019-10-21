# frozen_string_literal: true

module UsersHelper
  def user_invited?(invited_user)
    invited_user.friend_requests.where(requestor_id: current_user.id).empty?
  end
end
