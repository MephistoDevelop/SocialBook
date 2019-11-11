# frozen_string_literal: true

module PostsHelper
  def post_picture(post)
    image_tag post.avatar.variant(thumbnail: '100') if post.avatar.attached?
  end

  def author_avatar(post)
    user = post.author
    image_tag user.avatar.variant(thumbnail: '100') if user.avatar.attached?
  end
end
