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

    private 
    def user_params 
        params.permit(:email, :password, :password_confirmation)
    end 

end 