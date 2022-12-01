class ResultsController < ApplicationController
    before_action :require_logged_in

    def show 
        @profile = current_user.profiles.last 
    end 

    private
    def require_logged_in
        if !current_user
            flash[:error] = "Sorry, you must logged in" 
            redirect_to "/"
        end 
    end
end 