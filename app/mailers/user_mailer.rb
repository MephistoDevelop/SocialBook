class UserMailer < ApplicationMailer
    default from: 'agendator2019@gmail.com'

    def welcome_email
        @user = params[:user]
        @url  = 'google.com'
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end

    def send_signup_email(user)
        @user = user
        mail( :to => @user.email,
        :subject => 'Thanks for signing up for our amazing app' )
      end
end
