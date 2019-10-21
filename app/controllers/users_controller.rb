# frozen_string_literal: true

class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new; end

  def create; end

  def show; end

  def send_friend_request
    user=User.find(params[:user_id])
    current_user.friendships.build(requested_id: user.id).save
    flash[:success] = 'You sent a friend request'
    redirect_to user_root_path
  end

  def cancel_friend_request
    user=User.find(params[:invited_id])
    user. friend_requests.where(requestor_id: current_user.id).delete_all
    flash[:danger] = 'Invitation destroyed'
    redirect_to user_root_path
  end

  def friend_requests
    Friendship.where(requested_id: current_user.id)
  end

end
