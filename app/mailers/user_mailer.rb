class UserMailer < ApplicationMailer

  def password_reset_email
    @user = params[:user] 
    mail(to: @user.email, subject: "Your password has been reset")
  end
end