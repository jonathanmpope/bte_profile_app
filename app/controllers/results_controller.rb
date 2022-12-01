class ResultsController < ApplicationController
    before_action :require_logged_in

    def show 
        @profile = current_user.profiles.last
        @squat = @profile.exercises.where(name: "Back Squat").or(@profile.exercises.where(name: "Front Squat"))[0]
        @deadlift = @profile.exercises.where(name: "Straight Bar").or(@profile.exercises.where(name: "Trap Bar"))[0] 
        @press = @profile.exercises.where(name: "Bench Press").or(@profile.exercises.where(name: "Overhead Press (1 Arm)"))[0] 
        @weighted_pullup = @profile.exercises.where(name: "Weighted Pull-up")[0] 
    end 

    private
    def require_logged_in
        if !current_user
            flash[:error] = "Sorry, you must logged in" 
            redirect_to "/"
        end 
    end
end 