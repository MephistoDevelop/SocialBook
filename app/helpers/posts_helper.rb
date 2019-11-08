# frozen_string_literal: true

module PostsHelper

  def post_picture(post)
    if post.avatar.attached?
      image_tag post.avatar.variant(thumbnail: '100')
    end
  end

  def author_avatar(post)
    user = post.author.first
    if user.avatar.attached?
      image_tag user.avatar.variant(thumbnail: '100')
    end
  end
end
