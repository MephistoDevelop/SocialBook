# frozen_string_literal: true

module UsersHelper
  def user_invited?(invited_user)
    invited_user.pending_requests.where(requestor_id: current_user.id).empty?
  end

  def display_friend_requests(friendship)
    User.find(friendship.requestor_id).username
  end

  def accept_friend_now(friendship)
    User.find(friendship.requestor_id).id
  end

  def request?(friend)
    !current_user.pending_requests.where(requestor_id: friend.id).empty?
  end

  def show_user_friends
    names = current_user.friends.map(&:name)
    usernames = current_user.friends.map(&:username)
    (names + usernames).compact
  end

  def search_friend_email(name)
    q = current_user.friends.where(username: name).first
    return current_user.friends.where(name: name).first.email if q.nil?
    return q.email unless q.nil?
  end
end
