class AdminController < ApplicationController
    before_action :require_logged_in 

    def index 
        @admin = @current_admin
        if params[:search].present?
            @profiles = Profile.search_by_email(params[:search])
        else 
            @profiles = Profile.all 
        end
    end 

    private
    def require_logged_in
        if !current_admin
            flash[:error] = "Sorry, you must be an admin and logged in." 
            redirect_to "/"
        end 
    end 

end 