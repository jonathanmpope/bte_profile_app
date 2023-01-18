class ProgressController < ApplicationController
    before_action :require_logged_in
    include ProfileHelper

    def show
        if current_user.profiles != nil
            @profiles = current_user.profiles
        end 
    end 

    private
    def require_logged_in
        if !current_user
            flash[:error] = "Sorry, you must logged in" 
            redirect_to "/"
        end 
    end
end 

