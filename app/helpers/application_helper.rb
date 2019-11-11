# frozen_string_literal: true

module ApplicationHelper
  def friends_request_number
    current_user.friend_requests.size
  end

  def display_avatar(user)
    image_tag user.avatar.variant(virtual_pixel: 'HorizontalTile', resize: '300') if user.avatar.attached?
  end

  def comment_author_avatar(comment)
    user = comment.author
    image_tag user.avatar.variant(virtual_pixel: 'HorizontalTile', thumbnail: 'x100') if user.avatar.attached?
  end
end
