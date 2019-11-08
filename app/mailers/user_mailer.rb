# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'agendator2019@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail(to: @user.email,
         subject: 'Thanks for signing up for our amazing app').deliver_now
  end
end
