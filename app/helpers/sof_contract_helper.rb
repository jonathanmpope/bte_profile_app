module SofContractHelper
    
    def sof_land_contract_profile_calc_starter_method(profile)
        @profile = profile
        extended_capacity = profile.exercises.create!(category: 'conditioning', name:'8 mile ruck', value: "#{(params[:ruck_hours].to_i * 60) + params[:ruck_minutes].to_i}")
        capacity = profile.exercises.create!(category: 'conditioning', name:'5 mile run', value: "#{params[:five_mile_minutes].to_i + (params[:five_mile_seconds].to_f / 60)}")
        extended_power = profile.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: "#{params[:one_and_half_mile_run_minutes].to_i + (params[:one_and_half_mile_run_seconds].to_f / 60)}")
        power = profile.exercises.create!(category: 'conditioning', name:'400m run', value: "#{params[:four_hundred_run_minutes].to_i + (params[:four_hundred_run_seconds].to_f / 60)}")
        unit_conversion
        squat_variation = profile.exercises.create!(category: 'strength', name: "#{params[:squat]}", value: @squat_weight)
        deadlift_variation = profile.exercises.create!(category: 'strength', name: "#{params[:deadlift]}", value: @deadlift_weight)
        press_variation = profile.exercises.create!(category: 'strength', name: "#{params[:press]}", value: @press_weight)
        weighted_pullup = profile.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: @pullup_weight)
        pushups = profile.exercises.create!(category: 'work capacity', name: "Pushups", value: "#{params[:pushup_reps].to_i}")
        pullups = profile.exercises.create!(category: 'work capacity', name: "Pull-ups", value: "#{params[:pullup_reps].to_i}")
        hang = profile.exercises.create!(category: 'work capacity', name: "Hang", value: "#{params[:hang_minutes].to_i + (params[:hang_seconds].to_f / 60)}")
        strength_lower_calc_cont(squat_variation, deadlift_variation)
        strength_upper_calc_cont(press_variation, weighted_pullup)
        work_capacity_calc_cont(pushups, pullups, hang)
        conditioning_calc_land_cont(extended_capacity, capacity, extended_power, power)
    end 

    def sof_maritime_contract_profile_calc_starter_method(profile)
        @profile = profile
        extended_capacity = profile.exercises.create!(category: 'conditioning', name:'8 mile ruck', value: "#{(params[:ruck_hours].to_i * 60) + params[:ruck_minutes].to_i}")
        capacity = profile.exercises.create!(category: 'conditioning', name:'5 mile run', value: "#{params[:five_mile_minutes].to_i + (params[:five_mile_seconds].to_f / 60)}")
        capacity_swim = profile.exercises.create!(category: 'conditioning', name:'2000m swim', value: "#{params[:two_thousand_swim_minutes].to_i + (params[:two_thousand_swim_seconds].to_f / 60)}")
        extended_power = profile.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: "#{params[:one_and_half_mile_run_minutes].to_i + (params[:one_and_half_mile_run_seconds].to_f / 60)}")
        extended_power_swim = profile.exercises.create!(category: 'conditioning', name:'500m swim', value: "#{params[:five_hundred_swim_minutes].to_i + (params[:five_hundred_swim_seconds].to_f / 60)}")
        power = profile.exercises.create!(category: 'conditioning', name:'400m run', value: "#{params[:four_hundred_run_minutes].to_i + (params[:four_hundred_run_seconds].to_f / 60)}")
        unit_conversion
        squat_variation = profile.exercises.create!(category: 'strength', name: "#{params[:squat]}", value: @squat_weight)
        deadlift_variation = profile.exercises.create!(category: 'strength', name: "#{params[:deadlift]}", value: @deadlift_weight)
        press_variation = profile.exercises.create!(category: 'strength', name: "#{params[:press]}", value: @press_weight)
        weighted_pullup = profile.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: @pullup_weight)
        pushups = profile.exercises.create!(category: 'work capacity', name: "Pushups", value: "#{params[:pushup_reps].to_i}")
        pullups = profile.exercises.create!(category: 'work capacity', name: "Pull-ups", value: "#{params[:pullup_reps].to_i}")
        hang = profile.exercises.create!(category: 'work capacity', name: "Hang", value: "#{params[:hang_minutes].to_i + (params[:hang_seconds].to_f / 60)}")
        strength_lower_calc_cont(squat_variation, deadlift_variation)
        strength_upper_calc_cont(press_variation, weighted_pullup)
        work_capacity_calc_cont(pushups, pullups, hang)
        conditioning_mar_con_calc(extended_capacity, capacity, capacity_swim, extended_power, extended_power_swim, power)
    end 

    def sof_land_prep_profile_calc_starter_method(profile)
        @profile = profile 
        capacity = profile.exercises.create!(category: 'conditioning', name: params[:prep_run_or_ruck], value: "#{(params[:ruck_or_run_hours].to_i * 60) + params[:ruck_or_run_minutes].to_i}")
        extended_power = profile.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: "#{params[:one_and_half_mile_run_minutes].to_i + (params[:one_and_half_mile_run_seconds].to_f / 60)}")
        power = profile.exercises.create!(category: 'conditioning', name:'400m run', value: "#{params[:four_hundred_run_minutes].to_i + (params[:four_hundred_run_seconds].to_f / 60)}")
        unit_conversion
        squat_variation = profile.exercises.create!(category: 'strength', name: "#{params[:squat]}", value: @squat_weight)
        deadlift_variation = profile.exercises.create!(category: 'strength', name: "#{params[:deadlift]}", value: @deadlift_weight)
        press_variation = profile.exercises.create!(category: 'strength', name: "#{params[:press]}", value: @press_weight)
        weighted_pullup = profile.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: @pullup_weight)
        pushups = profile.exercises.create!(category: 'work capacity', name: "Pushups", value: "#{params[:pushup_reps].to_i}")
        pullups = profile.exercises.create!(category: 'work capacity', name: "Pull-ups", value: "#{params[:pullup_reps].to_i}")
        hang = profile.exercises.create!(category: 'work capacity', name: "Hang", value: "#{params[:hang_minutes].to_i + (params[:hang_seconds].to_f / 60)}")
        strength_lower_calc_prep(squat_variation, deadlift_variation)
        strength_upper_calc_prep(press_variation, weighted_pullup)
        work_capacity_calc_prep(pushups, pullups, hang)
        conditioning_calc_land_prep(capacity, extended_power, power)
    end 

     def sof_maritime_prep_profile_calc_starter_method(profile)
        @profile = profile 
        capacity = profile.exercises.create!(category: 'conditioning', name: params[:prep_run_or_ruck], value: "#{(params[:ruck_or_run_hours].to_i * 60) + params[:ruck_or_run_minutes].to_i}")
        extended_power_swim = profile.exercises.create!(category: 'conditioning', name:'500m swim', value: "#{params[:five_hundred_swim_minutes].to_i + (params[:five_hundred_swim_seconds].to_f / 60)}")
        extended_power = profile.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: "#{params[:one_and_half_mile_run_minutes].to_i + (params[:one_and_half_mile_run_seconds].to_f / 60)}")
        power = profile.exercises.create!(category: 'conditioning', name:'400m run', value: "#{params[:four_hundred_run_minutes].to_i + (params[:four_hundred_run_seconds].to_f / 60)}")
        unit_conversion
        squat_variation = profile.exercises.create!(category: 'strength', name: "#{params[:squat]}", value: @squat_weight)
        deadlift_variation = profile.exercises.create!(category: 'strength', name: "#{params[:deadlift]}", value: @deadlift_weight)
        press_variation = profile.exercises.create!(category: 'strength', name: "#{params[:press]}", value: @press_weight)
        weighted_pullup = profile.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: @pullup_weight)
        pushups = profile.exercises.create!(category: 'work capacity', name: "Pushups", value: "#{params[:pushup_reps].to_i}")
        pullups = profile.exercises.create!(category: 'work capacity', name: "Pull-ups", value: "#{params[:pullup_reps].to_i}")
        hang = profile.exercises.create!(category: 'work capacity', name: "Hang", value: "#{params[:hang_minutes].to_i + (params[:hang_seconds].to_f / 60)}")
        strength_lower_calc_prep(squat_variation, deadlift_variation)
        strength_upper_calc_prep(press_variation, weighted_pullup)
        work_capacity_calc_prep(pushups, pullups, hang)
        conditioning_calc_mar_prep(capacity, extended_power,  extended_power_swim, power)
    end 

    def unit_conversion
        if params[:units] == 'imperial'
            @squat_weight = params[:squat_weight].to_f
            @deadlift_weight = params[:deadlift_weight].to_f
            @press_weight = params[:press_weight].to_f
            @pullup_weight = params[:pullup_weight].to_f
        else 
            @squat_weight = params[:squat_weight].to_f * 2.20462
            @deadlift_weight = params[:deadlift_weight].to_f * 2.20462
            @press_weight = params[:press_weight].to_f * 2.20462
            @pullup_weight = params[:pullup_weight].to_f * 2.20462
        end
    end 

    def strength_lower_calc_cont(squat_variation, deadlift_variation)
        if squat_variation.name == 'Back Squat' && deadlift_variation.name == 'Trap Bar'
            back_squat_trap_bar_calc_cont(squat_variation, deadlift_variation)
        elsif squat_variation.name == 'Back Squat' && deadlift_variation.name == 'Straight Bar'
            back_squat_straight_bar_calc_cont(squat_variation, deadlift_variation)
        elsif squat_variation.name == 'Front Squat' && deadlift_variation.name == 'Trap Bar'
            front_squat_trap_bar_calc_cont(squat_variation, deadlift_variation)
        else 
            front_squat_straight_bar_calc_cont(squat_variation, deadlift_variation)
        end 
    end

    def strength_lower_calc_prep(squat_variation, deadlift_variation)
        if squat_variation.name == 'Back Squat' && deadlift_variation.name == 'Trap Bar'
            back_squat_trap_bar_calc_prep(squat_variation, deadlift_variation)
        elsif squat_variation.name == 'Back Squat' && deadlift_variation.name == 'Straight Bar'
            back_squat_straight_bar_calc_prep(squat_variation, deadlift_variation)
        elsif squat_variation.name == 'Front Squat' && deadlift_variation.name == 'Trap Bar'
            front_squat_trap_bar_calc_prep(squat_variation, deadlift_variation)
        else 
            front_squat_straight_bar_calc_prep(squat_variation, deadlift_variation)
        end 
    end

     def strength_upper_calc_cont(press_variation, weighted_pullup)
        if press_variation.name == 'Bench Press' 
            bench_press_pullup_calc_cont(press_variation, weighted_pullup)
        else 
            overhead_press_pullup_calc_cont(press_variation, weighted_pullup)
        end 
    end

     def strength_upper_calc_prep(press_variation, weighted_pullup)
        if press_variation.name == 'Bench Press' 
            bench_press_pullup_calc_prep(press_variation, weighted_pullup)
        else 
            overhead_press_pullup_calc_prep(press_variation, weighted_pullup)
        end 
    end

    # def power_calc(broad_jump)
    #     relative_power_percent = broad_jump.value / 8
    #     relative_power_percent >= 1.0 ? relative_power_percent = 1 : relative_power_percent 
    #     @power_score = (relative_power_percent - 0.5) * 200
    # end 

    def strength_calc 
       @strength_score = ((@strength_lower_score + @strength_upper_score) / 2)
        # power_total = @power_score * 0.2 
        # @strength_score = strength_total + power_total
    end 

    def work_capacity_calc_cont(pushups, pullups, hang)
        pushup_score = (pushups.value / 80.0 - 0.5) * 2.0
        pushup_score >= 1.0 ? pushup_score = 1 : pushup_score

        pullup_score = (pullups.value / 15.0 - 0.5) * 2
        pullup_score >= 1.0 ? pullup_score = 1 : pullup_score 

        hang_score = (hang.value / 1.5 - 0.5) * 2
        hang_score >= 1.0 ? hang_score = 1 : hang_score 

        @work_capacity_score = (pushup_score + pullup_score + hang_score) * 33.3
    end 

    def work_capacity_calc_prep(pushups, pullups, hang)
        pushup_score = (pushups.value / 50.0 - 0.5) * 2.0
        pushup_score >= 1.0 ? pushup_score = 1 : pushup_score

        pullup_score = (pullups.value / 10.0 - 0.5) * 2
        pullup_score >= 1.0 ? pullup_score = 1 : pullup_score 

        hang_score = (hang.value / 1.5 - 0.5) * 2
        hang_score >= 1.0 ? hang_score = 1 : hang_score 

        @work_capacity_score = (pushup_score + pullup_score + hang_score) * 33.3
    end 

    def conditioning_calc_land_cont(extended_capacity, capacity, extended_power, power)
        @extended_capacity_score = (120.0 / extended_capacity.value - 0.5) * 2.0
        @extended_capacity_score >= 1.0 ? @extended_capacity_score = 1 : @extended_capacity_score

        @capacity_score = (40.0 / capacity.value - 0.5) * 2.0
        @capacity_score >= 1.0 ? @capacity_score = 1 : @capacity_score

        @extended_power_score = (9.0 / extended_power.value - 0.5) * 2.0
        @extended_power_score >= 1.0 ? @extended_power_score = 1 : @extended_power_score

        @power_score = (1.16 / power.value - 0.5) * 2.0
        @power_score >= 1.0 ? @power_score = 1 : @power_score

        @conditioning_score = (@extended_capacity_score + @capacity_score + @extended_power_score + @power_score) * 25
        profile_update
    end 

    def conditioning_mar_con_calc(extended_capacity, capacity, capacity_swim, extended_power, extended_power_swim, power)
        @extended_capacity_score = (120.0 / extended_capacity.value - 0.5) * 2.0
        @extended_capacity_score >= 1.0 ? @extended_capacity_score = 1 : @extended_capacity_score

        capacity_run_score = (40.0 / capacity.value - 0.5) * 2.0
        capacity_swim_score = (40.0 / capacity_swim.value - 0.5) * 2.0
        @capacity_score = (capacity_run_score + capacity_swim_score) / 2
        @capacity_score >= 1.0 ? @capacity_score = 1 : @capacity_score

        extended_power_run_score = (9.0 / extended_power.value - 0.5) * 2.0
        extended_power_swim_score = (9.0 / extended_power_swim.value - 0.5) * 2.0
        @extended_power_score = (extended_power_run_score + extended_power_swim_score) / 2
        @extended_power_score >= 1.0 ? @extended_power_score = 1 : @extended_power_score

        @power_score = (1.16 / power.value - 0.5) * 2.0
        @power_score >= 1.0 ? @power_score = 1 : @power_score

        @conditioning_score = (@extended_capacity_score + @capacity_score + @extended_power_score + @power_score) * 25
        profile_update
    end 

    def conditioning_calc_land_prep(capacity, extended_power, power)
        @extended_capacity_score = 0 

        if capacity.name == '4 Mile Ruck'
            @capacity_score = (60.0 / capacity.value - 0.5) * 2.0
            @capacity_score >= 1.0 ? @capacity_score = 1 : @capacity_score
        else capacity.name == '3 Mile Run'
            @capacity_score = (24.0 / capacity.value - 0.5) * 2.0
            @capacity_score >= 1.0 ? @capacity_score = 1 : @capacity_score
        end 

        @extended_power_score = (10.5 / extended_power.value - 0.5) * 2.0
        @extended_power_score >= 1.0 ? @extended_power_score = 1 : @extended_power_score

        @power_score = (1.33 / power.value - 0.5) * 2.0
        @power_score >= 1.0 ? @power_score = 1 : @power_score

        @conditioning_score = (@capacity_score + @extended_power_score + @power_score) * 33
        profile_update
    end

    def conditioning_calc_mar_prep(capacity, extended_power, extended_power_swim, power)
        @extended_capacity_score = 0 

        if capacity.name == '4 Mile Ruck'
            @capacity_score = (60.0 / capacity.value - 0.5) * 2.0
            @capacity_score >= 1.0 ? @capacity_score = 1 : @capacity_score
        else capacity.name == '3 Mile Run'
            @capacity_score = (24.0 / capacity.value - 0.5) * 2.0
            @capacity_score >= 1.0 ? @capacity_score = 1 : @capacity_score
        end 

        extended_power_run_score = (10.5 / extended_power.value - 0.5) * 2.0
        extended_power_swim_score = (10.5 / extended_power_swim.value - 0.5) * 2.0
        @extended_power_score = (extended_power_run_score + extended_power_swim_score) / 2
        @extended_power_score >= 1.0 ? @extended_power_score = 1 : @extended_power_score

        @power_score = (1.33 / power.value - 0.5) * 2.0
        @power_score >= 1.0 ? @power_score = 1 : @power_score

        @conditioning_score = (@capacity_score + @extended_power_score + @power_score) * 33
        profile_update
    end
    
    def back_squat_trap_bar_calc_cont(squat_variation, deadlift_variation)
        relative_squat_percent = squat_variation.value / (@profile.weight * 1.75)
        relative_squat_percent >= 1.0 ? relative_squat_percent = 1 : relative_squat_percent 
        squat_score = (relative_squat_percent - 0.5) * 200

        relative_deadlift_percent = deadlift_variation.value / (@profile.weight * 2.0)
        relative_deadlift_percent >= 1 ? relative_deadlift_percent = 1 : relative_deadlift_percent
        deadlift_score = (relative_deadlift_percent - 0.5) * 200
        
        @strength_lower_score = (squat_score + deadlift_score) / 2
    end
    
     def back_squat_trap_bar_calc_prep(squat_variation, deadlift_variation)
        relative_squat_percent = squat_variation.value / (@profile.weight * 1.5)
        relative_squat_percent >= 1.0 ? relative_squat_percent = 1 : relative_squat_percent 
        squat_score = (relative_squat_percent - 0.5) * 200

        relative_deadlift_percent = deadlift_variation.value / (@profile.weight * 1.75)
        relative_deadlift_percent >= 1 ? relative_deadlift_percent = 1 : relative_deadlift_percent
        deadlift_score = (relative_deadlift_percent - 0.5) * 200
        
        @strength_lower_score = (squat_score + deadlift_score) / 2
    end 

    def back_squat_straight_bar_calc_cont(squat_variation, deadlift_variation)
        relative_squat_percent = squat_variation.value / (@profile.weight * 1.75)
        relative_squat_percent >= 1.0 ? relative_squat_percent = 1 : relative_squat_percent 
        squat_score = (relative_squat_percent - 0.5) * 200

        relative_deadlift_percent = deadlift_variation.value / (@profile.weight * 1.75)
        relative_deadlift_percent >= 1 ? relative_deadlift_percent = 1 : relative_deadlift_percent
        deadlift_score = (relative_deadlift_percent - 0.5) * 200
        
        @strength_lower_score = (squat_score + deadlift_score) / 2
    end 

    def back_squat_straight_bar_calc_prep(squat_variation, deadlift_variation)
        relative_squat_percent = squat_variation.value / (@profile.weight * 1.5)
        relative_squat_percent >= 1.0 ? relative_squat_percent = 1 : relative_squat_percent 
        squat_score = (relative_squat_percent - 0.5) * 200

        relative_deadlift_percent = deadlift_variation.value / (@profile.weight * 1.5)
        relative_deadlift_percent >= 1 ? relative_deadlift_percent = 1 : relative_deadlift_percent
        deadlift_score = (relative_deadlift_percent - 0.5) * 200
        
        @strength_lower_score = (squat_score + deadlift_score) / 2
    end

    def front_squat_trap_bar_calc_cont(squat_variation, deadlift_variation)
        relative_squat_percent = squat_variation.value / (@profile.weight * 1.5)
        relative_squat_percent >= 1.0 ? relative_squat_percent = 1 : relative_squat_percent 
        squat_score = (relative_squat_percent - 0.5) * 200

        relative_deadlift_percent = deadlift_variation.value / (@profile.weight * 2.0)
        relative_deadlift_percent >= 1 ? relative_deadlift_percent = 1 : relative_deadlift_percent
        deadlift_score = (relative_deadlift_percent - 0.5) * 200
        
        @strength_lower_score = (squat_score + deadlift_score) / 2
    end

    def front_squat_trap_bar_calc_prep(squat_variation, deadlift_variation)
        relative_squat_percent = squat_variation.value / (@profile.weight * 1.25)
        relative_squat_percent >= 1.0 ? relative_squat_percent = 1 : relative_squat_percent 
        squat_score = (relative_squat_percent - 0.5) * 200

        relative_deadlift_percent = deadlift_variation.value / (@profile.weight * 1.75)
        relative_deadlift_percent >= 1 ? relative_deadlift_percent = 1 : relative_deadlift_percent
        deadlift_score = (relative_deadlift_percent - 0.5) * 200
        
        @strength_lower_score = (squat_score + deadlift_score) / 2
    end
    
     def front_squat_straight_bar_calc_cont(squat_variation, deadlift_variation)
        relative_squat_percent = squat_variation.value / (@profile.weight * 1.5)
        relative_squat_percent >= 1.0 ? relative_squat_percent = 1 : relative_squat_percent 
        squat_score = (relative_squat_percent - 0.5) * 200

        relative_deadlift_percent = deadlift_variation.value / (@profile.weight * 1.75)
        relative_deadlift_percent >= 1 ? relative_deadlift_percent = 1 : relative_deadlift_percent
        deadlift_score = (relative_deadlift_percent - 0.5) * 200
        
        @strength_lower_score = (squat_score + deadlift_score) / 2
    end

    def front_squat_straight_bar_calc_prep(squat_variation, deadlift_variation)
        relative_squat_percent = squat_variation.value / (@profile.weight * 1.25)
        relative_squat_percent >= 1.0 ? relative_squat_percent = 1 : relative_squat_percent 
        squat_score = (relative_squat_percent - 0.5) * 200

        relative_deadlift_percent = deadlift_variation.value / (@profile.weight * 1.5)
        relative_deadlift_percent >= 1 ? relative_deadlift_percent = 1 : relative_deadlift_percent
        deadlift_score = (relative_deadlift_percent - 0.5) * 200
        
        @strength_lower_score = (squat_score + deadlift_score) / 2
    end

    def bench_press_pullup_calc_cont(press_variation, pullup)
        relative_press_percent = press_variation.value / (@profile.weight * 1.25)
        relative_press_percent >= 1.0 ? relative_press_percent = 1 : relative_press_percent 
        press_score = (relative_press_percent - 0.5) * 200

        relative_pullup_percent = pullup.value / (@profile.weight * 1.4)
        relative_pullup_percent >= 1.0 ? relative_pullup_percent = 1 : relative_pullup_percent 
        pullup_score = (relative_pullup_percent - 0.5) * 200

        @strength_upper_score = (press_score + pullup_score) / 2
        strength_calc
    end 

    def bench_press_pullup_calc_prep(press_variation, pullup)
        relative_press_percent = press_variation.value / (@profile.weight * 1.0)
        relative_press_percent >= 1.0 ? relative_press_percent = 1 : relative_press_percent 
        press_score = (relative_press_percent - 0.5) * 200

        relative_pullup_percent = pullup.value / (@profile.weight * 1.2)
        relative_pullup_percent >= 1.0 ? relative_pullup_percent = 1 : relative_pullup_percent 
        pullup_score = (relative_pullup_percent - 0.5) * 200

        @strength_upper_score = (press_score + pullup_score) / 2
        strength_calc
    end

    def overhead_press_pullup_calc_cont(press_variation, pullup)
        relative_press_percent = press_variation.value / (@profile.weight * 0.45)
        relative_press_percent >= 1.0 ? relative_press_percent = 1 : relative_press_percent 
        press_score = (relative_press_percent - 0.5) * 200

        relative_pullup_percent = pullup.value / (@profile.weight * 1.4)
        relative_pullup_percent >= 1.0 ? relative_pullup_percent = 1 : relative_pullup_percent 
        pullup_score = (relative_pullup_percent - 0.5) * 200

        @strength_upper_score = (press_score + pullup_score) / 2
        strength_calc
    end

     def overhead_press_pullup_calc_prep(press_variation, pullup)
        relative_press_percent = press_variation.value / (@profile.weight * 0.35)
        relative_press_percent >= 1.0 ? relative_press_percent = 1 : relative_press_percent 
        press_score = (relative_press_percent - 0.5) * 200

        relative_pullup_percent = pullup.value / (@profile.weight * 1.2)
        relative_pullup_percent >= 1.0 ? relative_pullup_percent = 1 : relative_pullup_percent 
        pullup_score = (relative_pullup_percent - 0.5) * 200

        @strength_upper_score = (press_score + pullup_score) / 2
        strength_calc
    end

    def profile_update 
        @profile.update(weight: @profile.weight, track: @profile.track, strength_lower_score: @strength_lower_score, strength_upper_score: @strength_upper_score, strength_score: @strength_score, conditioning_extended_capacity_score: (@extended_capacity_score * 100), conditioning_capacity_score: (@capacity_score * 100), conditioning_extended_power_score: (@extended_power_score * 100), conditioning_power_score: (@power_score * 100), conditioning_score: @conditioning_score, work_capacity_score: @work_capacity_score)
    end 
end 