# frozen_string_literal: true
module UsersHelper
  def user_invited?(invited_user)
    invited_user.friend_requests.where(requestor_id: current_user.id).empty?
  end

  def display_friend_requests(friendship)
    User.find(friendship.requestor_id).username
  end

  def accept_friend_now(friendship)
    User.find(friendship.requestor_id).id
  end

  def have_request?(friend)
    !current_user.friend_requests.where(requestor_id:friend.id ).empty?
  end
end
