# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new; end

  def create; end

  def show; end

  def show_friends; end

  def send_friend_request
    user = User.find(params[:user_id])
    if !current_user.send_friend_request(user).nil?
      flash[:success] = 'You sent a friend request'
    else
      flash[:danger] = 'Not a valid invitation'
    end
    redirect_to user_root_path
  end

  def cancel_friend_request
    user = User.find(params[:invited_id])
    user. friend_requests.where(requestor_id: current_user.id).delete_all
    flash[:danger] = 'Invitation destroyed'
    redirect_to user_root_path
  end

  def friend_requests
    Friendship.where(requested_id: current_user.id)
  end

  def accept_friend
    @friend = User.find(params[:friend_o])
    current_user.accept_friend_request(@friend)
    redirect_to user_root_path
  end

  def delete_friend
    @user = User.find(params[:friend_d])
    current_user.unfriend(@user)
    redirect_to user_root_path
  end
end
