# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    # uts "Soy la session del form: #{session['login_form']} <---"
    # puts "Soy current user: #{User.where(id: session['user_id']).first}, y y soy  current_user: #{current_user}"
    # puts "Yo soy omiauth_login: #{session['omniauth_login']}"
    # puts "Soy la sesion !!! : #{session.to_hash}"
    User.where(id: session['user_id']).first if session['omniauth_login']
    current_user = User.find(session['warden.user.user.key'].first.first)
    session['user_id'] = current_user.id
    ids = current_user.followeds.pluck(:id) + current_user.followers.pluck(:id) << current_user.id
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
    redirect_to posts_path
  end

  def add_like_post
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
