# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
  end

  def new; end

  def create; end

  def show
    @user = User.find(params[:id])
  end

  def friends
     @user = current_user
  end
end
