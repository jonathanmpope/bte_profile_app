class ResultsController < ApplicationController
    before_action :require_logged_in

    def show 
        @profile = current_user.profiles.last
        # profile_bias_calc
        @power = @profile.exercises.where(name: "400m run")[0] 
        @pushups = @profile.exercises.where(name: "Pushups")[0] 
        @pullups = @profile.exercises.where(name: "Pull-ups")[0] 
        @hang = @profile.exercises.where(name: "Hang")[0] 
        @squat = @profile.exercises.where(name: "Back Squat").or(@profile.exercises.where(name: "Front Squat"))[0]
        @deadlift = @profile.exercises.where(name: "Straight Bar").or(@profile.exercises.where(name: "Trap Bar"))[0] 
        @press = @profile.exercises.where(name: "Bench Press").or(@profile.exercises.where(name: "Overhead Press (1 Arm)"))[0] 
        @weighted_pullup = @profile.exercises.where(name: "Weighted Pull-up")[0] 
        if @profile.track == 'sof_mar_cont' || @profile.track == 'sof_land_cont'
            @extended_capacity = @profile.exercises.where(name: "8 mile ruck")[0] 
            @capacity = @profile.exercises.where(name: "5 mile run")[0]
            work_capacity_scores_cont
        else 
            @capacity = @profile.exercises.where(name: "4 Mile Ruck").or(@profile.exercises.where(name: "3 Mile Run"))[0]
            work_capacity_scores_prep  
        end 
        @extended_power = @profile.exercises.where(name: "1.5 mile run")[0] 
        if @profile.track == 'sof_mar_cont'
            @capacity_swim = @profile.exercises.where(name: "2000m swim")[0]
            @extended_power_swim = @profile.exercises.where(name: "500m swim")[0]
        elsif @profile.track == 'sof_mar_prep'
            @extended_power_swim = @profile.exercises.where(name: "500m swim")[0]
        end 
    end 

    def work_capacity_scores_cont 
        @pushup_score = (@pushups.value / 80.0 - 0.5) * 2.0
        @pushup_score >= 1.0 ? @pushup_score = 1 : @pushup_score

        @pullup_score = (@pullups.value / 15.0 - 0.5) * 2
        @pullup_score >= 1.0 ? @pullup_score = 1 : @pullup_score 

        @hang_score = (@hang.value / 1.5 - 0.5) * 2
        @hang_score >= 1.0 ? @hang_score = 1 : @hang_score 
    end 

    def work_capacity_scores_prep 
        @pushup_score = (@pushups.value / 50.0 - 0.5) * 2.0
        @pushup_score >= 1.0 ? @pushup_score = 1 : @pushup_score

        @pullup_score = (@pullups.value / 10.0 - 0.5) * 2
        @pullup_score >= 1.0 ? @pullup_score = 1 : @pullup_score 

        @hang_score = (@hang.value / 1.5 - 0.5) * 2
        @hang_score >= 1.0 ? @hang_score = 1 : @hang_score 
    end

    # def profile_bias_calc
    #     strength_diff = 
    #     cond_diff = 
    #     wc_diff = 
    #     if   
    #         @profile_bias = 'Progress'
    #     elsif 
    #         @profile_bias = 'Strength'
    #     elsif 
    #         @profile_bias = 'Conditioning'
    #     else  
    #         @profile_bias = 'Balanced'
    #     end 
    # end 

    private
    def require_logged_in
        if !current_user
            flash[:error] = "Sorry, you must logged in" 
            redirect_to "/"
        end 
    end
end 