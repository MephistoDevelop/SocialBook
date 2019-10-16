# frozen_string_literal: true

module PostsHelper
  def display_reactions
    if @post.add_like(current_user) == false
      @post.add_dislike(current_user)
    end
  end
end
