class ResultsController < ApplicationController
    before_action :require_logged_in
    include ResultsHelper

    def show 
        @profile = current_user.profiles.last
        profile_bias_calc
        exercise_creator
    end 

    def index  
        @profiles = Profile.find_by_user(@user.id)
    end 

    private
    def require_logged_in
        if !current_user
            flash[:error] = "Sorry, you must logged in" 
            redirect_to "/"
        end 
    end
end 