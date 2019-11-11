# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
  end

  def new; end

  def create; end

  def destroy
    current_user.destroy
    redirect_to new_user_session_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:avatar])
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  def friends
    @user = current_user
  end
end
