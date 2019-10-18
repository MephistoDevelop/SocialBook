# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)
    @post.save
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def add_like
    @post = Post.find(params[:post_id])
    if @post.user_reacted?(current_user)
      @post.destroy_reaction(current_user)
    else
      @post.add_like(current_user)
    end
    redirect_to @post
  end
  #   def add_dislike
  #     @post = Post.find(params[:post_id])
  #     if @post.user_reacted?(current_user)
  #       @post.toggle_reaction(current_user)
  #       redirect_to @post
  #     else
  #       @post.reactions << current_user.reactions.create(user_reaction: 'DisLike')
  #       redirect_to @post
  #     end
  #   end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
