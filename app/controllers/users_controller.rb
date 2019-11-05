# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = User.where.not(id: current_user.id)
  end

  def new; end

  def create
      @user = User.new(params[:user])
   
      respond_to do |format|
        if @user.save
          # Tell the UserMailer to send a welcome email after save
          UserMailer.with(user: @user).welcome_email.deliver_later
   
          format.html { redirect_to(@user, notice: 'User was successfully created.') }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

  def show
    @users = User.all
  end

  def show_friends; end
end
