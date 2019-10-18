# frozen_string_literal: true

module PostsHelper

  def author_name(comment)
    User.where(id: comment.author_id).pluck(:username).first
  end

  def post_author(post)
    User.where(id: post.user_id).pluck(:username)[0]
  end

  def comment_author(comment)
    User.where(id: comment.author_id).pluck(:username)[0]
  end
end
