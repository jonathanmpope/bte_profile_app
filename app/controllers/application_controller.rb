class ApplicationController < ActionController::Base
    helper_method :current_user, :current_admin, :check_profiles

    def current_user
       @user ||= User.find(session[:user_id]) if session[:user_id] 
    end 

    def current_admin
       @current_admin ||= User.find(session[:user_id]) if User.find(session[:user_id]).admin == true
    end 
end
