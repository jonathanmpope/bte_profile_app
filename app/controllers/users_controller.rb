class UsersController < ApplicationController

    def new 
    end  

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id 
            redirect_to "/profile" 
        else 
            redirect_to "/users/new" 
            flash[:error] = user.errors.full_messages
        end 
    end 

    def edit
    end 

    def update 
        user = User.find_by(email: params[:email])
        if user != nil 
            password_update(user)
        else 
            flash[:error] = "That email is not associated with an account"
        end 
    end 

    private 
    def password_update(user)
        new_password = SecureRandom.hex(4)
        user.update(password: new_password, password_confirmation: new_password)
        UserMailer.with(user: user, password: new_password).password_reset_email.deliver_later
        redirect_to "/"
        flash[:error] = "Email sent. Check your inbox for the new password"
    end 

    def user_params 
        params.permit(:email, :password, :password_confirmation)
    end 

end 