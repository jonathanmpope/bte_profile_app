class ProfilesController < ApplicationController
    before_action :require_logged_in

    def new 
        if params[:commit] != nil  
            @track = params[:track]
        end 
    end 

    def create 
    end 

    private
    def require_logged_in
        if !current_user
            flash[:error] = "Sorry, you must logged in" 
            redirect_to "/"
        end 
    end 
end 