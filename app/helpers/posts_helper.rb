# frozen_string_literal: true

module PostsHelper
  def display_reactions
    @post.add_dislike(current_user) if @post.add_like(current_user) == false
  end

  def search_user_reactions(post,user_id)
      @post =post
      puts @post.reactions.where(user_id: user_id)
  end
end
