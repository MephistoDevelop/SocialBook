# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = User.where.not(id: current_user.id)
  end

  def new; end

  def create; end

  def show; end

  def show_friends; end

  def friend_requests
    Friendship.where(requested_id: current_user.id)
  end
end
