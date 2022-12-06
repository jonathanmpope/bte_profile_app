class ResultsController < ApplicationController
    before_action :require_logged_in

    def show 
        @profile = current_user.profiles.last
        @squat = @profile.exercises.where(name: "Back Squat").or(@profile.exercises.where(name: "Front Squat"))[0]
        @deadlift = @profile.exercises.where(name: "Straight Bar").or(@profile.exercises.where(name: "Trap Bar"))[0] 
        @press = @profile.exercises.where(name: "Bench Press").or(@profile.exercises.where(name: "Overhead Press (1 Arm)"))[0] 
        @weighted_pullup = @profile.exercises.where(name: "Weighted Pull-up")[0] 
        @extended_capacity = @profile.exercises.where(name: "8 mile ruck")[0] 
        @capacity = @profile.exercises.where(name: "5 mile run")[0] 
        @extended_power = @profile.exercises.where(name: "1.5 mile run")[0] 
        @power = @profile.exercises.where(name: "400m run")[0] 
        @pushups = @profile.exercises.where(name: "Pushups")[0] 
        @pullups = @profile.exercises.where(name: "Pull-ups")[0] 
        @hang = @profile.exercises.where(name: "Hang")[0] 
        if @profile.track == 'sof_mar_cont'
            @capacity_swim = @profile.exercises.where(name: "2000m swim")[0]
            @extended_power_swim = @profile.exercises.where(name: "500m swim")[0]
        end 
        work_capacity_scores
    end 

    def work_capacity_scores 
        @pushup_score = (@pushups.value / 80.0 - 0.5) * 2.0
        @pushup_score >= 1.0 ? @pushup_score = 1 : @pushup_score

        @pullup_score = (@pullups.value / 15.0 - 0.5) * 2
        @pullup_score >= 1.0 ? @pullup_score = 1 : @pullup_score 

        @hang_score = (@hang.value / 1.5 - 0.5) * 2
        @hang_score >= 1.0 ? @hang_score = 1 : @hang_score 
    end 

    private
    def require_logged_in
        if !current_user
            flash[:error] = "Sorry, you must logged in" 
            redirect_to "/"
        end 
    end
end 