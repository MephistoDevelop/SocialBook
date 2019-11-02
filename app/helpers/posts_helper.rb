# frozen_string_literal: true

module PostsHelper
  def author_name(comment)
    User.where(id: comment.author_id).pluck(:username).first
  end

  def post_author(post)
   q= User.where(id: post.user_id).pluck(:username)[0]
    if q != nil
        return q
    else
      return User.where(id: post.user_id).pluck(:name)[0]
    end
  end

  def comment_author(comment)
    User.where(id: comment.author_id).pluck(:username)[0]
  end
end
