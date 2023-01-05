class AdminController < ApplicationController
    before_action :require_logged_in 

    def index 
        @admin = @current_admin
        if params[:search].present?
            @profiles = User.search_by_email(params[:search]).profiles
        else 
            @profiles = Profile.all 
        end
    end 

    def destroy 
        binding.pry 
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