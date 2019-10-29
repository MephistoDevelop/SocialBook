# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    ids =  current_user.followeds.pluck(:id) + current_user.followers.pluck(:ids) + current_user.id
    @posts = Post.where(user_id: ids)
    @comment = Comment.new
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

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
