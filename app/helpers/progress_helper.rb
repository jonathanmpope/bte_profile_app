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
        uppper_body_strength_movements
        work_capacity_movements 
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

    def uppper_body_strength_movements 
        bench_press_movements_calc
        overhead_press_movements_calc
        db_bench_press_movements_calc
        db_row_movements_calc
        weighted_pullup_movements_calc
    end 

    def bench_press_movements_calc
        @bench_press_movements = @user.bench_press_movements
        @bench_press_scores = Hash.new(0)
        if @bench_press_movements == []
            @bench_press_scores = {'Jan 05, 2021' => 0} 
        else 
            @bench_press_movements.each { |press| @bench_press_scores[press.created_at.strftime("%b %d, %Y")] = "#{press.value.round(0)}"}
        end

    end 

    def db_bench_press_movements_calc
        @db_bench_press_movements = @user.db_bench_press_movements
        @db_bench_press_scores = Hash.new(0)
        if @db_bench_press_movements == []
            @db_bench_press_scores = {'Jan 05, 2021' => 0} 
        else 
            @db_bench_press_movements.each { |press| @db_bench_press_scores[press.created_at.strftime("%b %d, %Y")] = "#{press.value.round(0)}"}
        end
    end 

    def overhead_press_movements_calc
        @overhead_press_movements = @user.overhead_press_movements
        @overhead_press_scores = Hash.new(0)
        if @overhead_press_movements == []
            @overhead_press_scores = {'Jan 05, 2021' => 0} 
        else 
            @overhead_press_movements.each { |press| @overhead_press_scores[press.created_at.strftime("%b %d, %Y")] = "#{press.value.round(0)}"}
        end
    end

    def db_row_movements_calc
        @db_row_movements = @user.db_row_movements
        @db_row_scores = Hash.new(0)
        if @db_row_movements == []
            @db_row_scores = {'Jan 05, 2021' => 0} 
        else 
            @db_row_movements.each { |pull| @db_row_scores[pull.created_at.strftime("%b %d, %Y")] = "#{pull.value.round(0)}"}
        end
    end

    def weighted_pullup_movements_calc
        @weighted_pullup_movements = @user.weighted_pullup_movements
        @weighted_pullup_scores = Hash.new(0)
        if @weighted_pullup_movements == []
            @weighted_pullup_scores = {'Jan 05, 2021' => 0} 
        else 
            @weighted_pullup_movements.each { |pull| @weighted_pullup_scores[pull.created_at.strftime("%b %d, %Y")] = "#{pull.value.round(0)}"}
        end
    end

    def work_capacity_movements
        pushup_movements
        pullup_movements
        dip_movements
        hang_movements
    end 

    def pushup_movements
        @pushup_movements = @user.pushup_movements
        @pushup_scores = Hash.new(0)
        if @pushup_movements == []
            @pushup_scores = {'Jan 05, 2021' => 0} 
        else 
            @pushup_movements.each { |pushup| @pushup_scores[pushup.created_at.strftime("%b %d, %Y")] = "#{pushup.value.round(0)}"}
        end
    end 

    def pullup_movements
        @pullup_movements = @user.pullup_movements
        @pullup_scores = Hash.new(0)
        if @pullup_movements == []
            @pullup_scores = {'Jan 05, 2021' => 0} 
        else 
            @pullup_movements.each { |pullup| @pullup_scores[pullup.created_at.strftime("%b %d, %Y")] = "#{pullup.value.round(0)}"}
        end
    end 

    def dip_movements
        @dip_movements = @user.dip_movements
        @dip_scores = Hash.new(0)
        if @dip_movements == []
            @dip_scores = {'Jan 05, 2021' => 0} 
        else 
            @dip_movements.each { |dip| @dip_scores[dip.created_at.strftime("%b %d, %Y")] = "#{dip.value.round(0)}"}
        end
    end 

    def hang_movements
        @hang_movements = @user.hang_movements
        @hang_scores = Hash.new(0)
        if @hang_movements == []
            @hang_scores = {'Jan 05, 2021' => 0} 
        else 
            @hang_movements.each { |hang| @hang_scores[hang.created_at.strftime("%b %d, %Y")] = "#{(hang.value * 60).round(0)}"}
        end 
    end 
end 