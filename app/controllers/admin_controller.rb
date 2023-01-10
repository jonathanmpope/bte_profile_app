class AdminController < ApplicationController
    before_action :require_logged_in 

    def index 
        @admin = @current_admin
        if params[:search].present?
            user = User.search_by_email(params[:search])
            if user != nil 
                @profiles = user.profiles
            end 
        else 
            @profiles = Profile.all 
        end
    end 

    def destroy 
        profile = Profile.find(params[:admin_profile_id])
        profile.destroy  
        redirect_to '/admin'
    end 

    private
    def require_logged_in
        if !current_admin
            flash[:error] = "Sorry, you must be an admin and logged in." 
            redirect_to "/"
        end 
    end 

end 