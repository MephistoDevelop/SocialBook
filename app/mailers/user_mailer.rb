class UserMailer < ApplicationMailer
    default from: 'agendator2019@gmail.com'
    
    def welcome_email
        @user = params[:user]
        @url  = 'google.com'
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end
