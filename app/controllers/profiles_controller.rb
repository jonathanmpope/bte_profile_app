class ProfilesController < ApplicationController
    before_action :require_logged_in
    include ProfileHelper

    def new 
        if params[:commit] != nil  
            @track = params[:track]
        end 
    end 

    def create 
        profile_creation 
        profile_starter_methods 
        redirect_to '/results'
    end 

    private
    def require_logged_in
        if !current_user
            flash[:error] = "Sorry, you must logged in" 
            redirect_to "/"
        end 
    end
end 