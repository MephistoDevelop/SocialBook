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
  end

  def create_like
    self.add_like(current_user)
  end

  def add_like
    @post=Post.find(params[:post_id])
    @post.reactions << current_user.reactions.create(user_reaction: "Like")
    redirect_to @post
  end
  def add_dislike
    @post=Post.find(params[:post_id])
    @post.reactions << current_user.reactions.create(user_reaction: "DisLike")
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
