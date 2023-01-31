module ProgressHelper 

    def main_graph_data
        total_scores
        strength_scores
        conditioning_scores
        work_capacity_scores
        strength_lower_scores 
        strength_upper_scores
        extended_capacity_scores
        capacity_scores 
        extended_power_scores
        power_scores
        lower_body_strength_movements
    end 

    def total_scores
        @total_scores = Hash.new(0)
        @profiles.each { |profile| @total_scores[profile.created_at.strftime("%b %d, %Y")] = ((profile.strength_score + profile.conditioning_score + profile.work_capacity_score) / 3).round(0)}
    end 

    def strength_scores
        @strength_scores = Hash.new(0)
        @profiles.each { |profile| @strength_scores[profile.created_at.strftime("%b %d, %Y")] = profile.strength_score.round(0)}
    end 

    def conditioning_scores
        @conditioning_scores = Hash.new(0)
        @profiles.each { |profile| @conditioning_scores[profile.created_at.strftime("%b %d, %Y")] = profile.conditioning_score.round(0)}
    end 

    def work_capacity_scores
        @work_capacity_scores = Hash.new(0)
        @profiles.each { |profile| @work_capacity_scores[profile.created_at.strftime("%b %d, %Y")] = profile.work_capacity_score.round(0)}
    end

    def strength_lower_scores
        @strength_lower_scores = Hash.new(0)
        @profiles.each { |profile| @strength_lower_scores[profile.created_at.strftime("%b %d, %Y")] = profile.strength_lower_score.round(0)}
    end 

    def strength_upper_scores 
        @strength_upper_scores = Hash.new(0)
        @profiles.each { |profile| @strength_upper_scores[profile.created_at.strftime("%b %d, %Y")] = profile.strength_upper_score.round(0)}
    end 

    def extended_capacity_scores
        @extended_capacity_scores = Hash.new(0) 
        @profiles.each { |profile| @extended_capacity_scores[profile.created_at.strftime("%b %d, %Y")] = profile.conditioning_extended_capacity_score.round(0)}
    end 

    def capacity_scores
        @capacity_scores = Hash.new(0)
        @profiles.each { |profile| @capacity_scores[profile.created_at.strftime("%b %d, %Y")] = profile.conditioning_capacity_score.round(0)}
    end

    def extended_power_scores
        @extended_power_scores = Hash.new(0)
        @profiles.each { |profile| @extended_power_scores[profile.created_at.strftime("%b %d, %Y")] = profile.conditioning_extended_power_score.round(0)}
    end

    def power_scores
        @power_scores = Hash.new(0)
        @profiles.each { |profile| @power_scores[profile.created_at.strftime("%b %d, %Y")] = profile.conditioning_power_score.round(0)}
    end

    def lower_body_strength_movements
        goblet_squat_movements_calc
        front_squat_movements_calc
        back_squat_movements_calc
        trap_bar_movements_calc
        straight_bar_movements_calc
    end 

    def goblet_squat_movements_calc
        @goblet_squat_movements = @user.goblet_squat_movements
        @goblet_squat_scores = Hash.new(0)
        if @goblet_squat_movements == []
            @goblet_squat_scores = {'Jan 05, 2021' => 0} 
        else 
            @goblet_squat_movements.each { |squat| @goblet_squat_scores[squat.created_at.strftime("%b %d, %Y")] = "#{squat.value.round(0)}"}
        end 
    end 

    def back_squat_movements_calc
         @back_squat_movements = @user.back_squat_movements
        @back_squat_scores = Hash.new(0)
        if @back_squat_movements == []
            @back_squat_scores = {'Jan 05, 2021' => 0} 
        else 
            @back_squat_movements.each { |squat| @back_squat_scores[squat.created_at.strftime("%b %d, %Y")] = "#{squat.value.round(0)}"}
        end 
    end 

    def front_squat_movements_calc
         @front_squat_movements = @user.front_squat_movements
        @front_squat_scores = Hash.new(0)
        if @front_squat_movements == []
            @front_squat_scores = {'Jan 05, 2021' => 0} 
        else 
            @front_squat_movements.each { |squat| @front_squat_scores[squat.created_at.strftime("%b %d, %Y")] = "#{squat.value.round(0)}"}
        end 
    end 

    def trap_bar_movements_calc
        @trap_bar_movements = @user.trap_bar_movements
        @trap_bar_scores = Hash.new(0)
        if @trap_bar_movements == []
            @trap_bar_scores = {'Jan 05, 2021' => 0} 
        else 
            @trap_bar_movements.each { |dl| @trap_bar_scores[dl.created_at.strftime("%b %d, %Y")] = "#{dl.value.round(0)}"}
        end
    end 

    def straight_bar_movements_calc
        @straight_bar_movements = @user.straight_bar_movements
        @straight_bar_scores = Hash.new(0)
        if @straight_bar_movements == []
            @straight_bar_scores = {'Jan 05, 2021' => 0} 
        else 
            @straight_bar_movements.each { |dl| @straight_bar_scores[dl.created_at.strftime("%b %d, %Y")] = "#{dl.value.round(0)}"}
        end
    end 
end 