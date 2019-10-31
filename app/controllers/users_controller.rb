# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = User.where.not(id: current_user.id)
  end

  def new; end

  def create; end

  def show
    @users = User.all
  end

  def show_friends; end
end
