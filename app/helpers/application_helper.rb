# frozen_string_literal: true

module ApplicationHelper
  def friends_request_number
    current_user.friend_requests.size
  end

  def display_avatar(user)
    if user.avatar.attached?
      image_tag user.avatar.variant(virtual_pixel: 'HorizontalTile', resize: '300')
    end
  end

  def comment_author_avatar(comment)
    user = comment.author
    if user.avatar.attached?
      image_tag user.avatar.variant(virtual_pixel: 'HorizontalTile', thumbnail: 'x100')
    end
  end
end
