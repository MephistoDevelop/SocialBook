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

  def show_user_friends
    friends = []
    collection = current_user.friends
    collection.each do |friendship|
      if friendship.user_requestor.first.id != current_user.id
        friends << friendship.user_requestor.first.username
      else
        friends << friendship.user_requested.first.username
      end
    end
    friends
  end
    
end

