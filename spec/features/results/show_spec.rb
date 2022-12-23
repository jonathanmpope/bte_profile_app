require 'rails_helper'

RSpec.describe 'the landing page' do 
    before :each do 
        visit '/'

        @user = User.create!(email: 'test@test.com', password: "test123", password_confirmation: "test123")

        password = "test123"
        @email = 'test@test.com'

        fill_in :email, with: @email
        fill_in :password, with: password

        click_on "Login"
    end 

    it 'should show strength results for sof land contract profile' do
        @profile = @user.profiles.create!(weight: 195.0, track: "sof_land_cont", strength_lower_score: 100.0, strength_upper_score: 97.06959706959707, strength_score: 98.53479853479854, conditioning_extended_capacity_score: 77.77777777777777, conditioning_capacity_score: 98.75776397515527, conditioning_extended_power_score: 66.15384615384615, conditioning_power_score: 54.666666666666664, conditioning_score: 74.33901364336147, work_capacity_score: 53.464999999999996, unit_type: 'imperial')
        
        @squat = @profile.exercises.create!(category: 'strength', name: "Back Squat", value: 355)
        @deadlift = @profile.exercises.create!(category: 'strength', name: "Trap Bar", value: 455)
        @press = @profile.exercises.create!(category: 'strength', name: "Bench Press", value: 275)
        @weighted_pullup = @profile.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: 260)

        @extended_capacity = @profile.exercises.create!(category: 'conditioning', name:'8 mile ruck', value: 120)
        @capacity = @profile.exercises.create!(category: 'conditioning', name:'5 mile run', value: 35.5)
        @extended_power = @profile.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: 10.6967)
        @power = @profile.exercises.create!(category: 'conditioning', name:'400m run', value: 1.896)

        @pushups = @profile.exercises.create!(category: 'work capacity', name:'Pushups', value: 55)
        @pullups = @profile.exercises.create!(category: 'work capacity', name:'Pull-ups', value: 12)
        @hang = @profile.exercises.create!(category: 'work capacity', name:'Hang', value: 1.5)

        visit '/results'

        expect(page).to have_content("SOF Land Contract Assessment Results")
        expect(page).to have_content("Overall Score: 75")
        expect(page).to have_content("Strength Score: 99")
        expect(page).to have_content("Lower Body Score: 100")
        expect(page).to have_content("Upper Body Score: 97")
        expect(page).to have_content(@squat.value.round(0))
        expect(page).to have_content(@squat.name)
        expect(page).to have_content(@deadlift.value.round(0))
        expect(page).to have_content(@deadlift.name)
        expect(page).to have_content(@press.value.round(0))
        expect(page).to have_content(@press.name)
        expect(page).to have_content(@weighted_pullup.value.round(0))
        expect(page).to have_content(@weighted_pullup.name)
    end 

    it 'should show conditioning results for a sof land contract profile' do
        @profile = @user.profiles.create!(weight: 195.0, track: "sof_land_cont", strength_lower_score: 100.0, strength_upper_score: 97.06959706959707, strength_score: 98.53479853479854, conditioning_extended_capacity_score: 77.77777777777777, conditioning_capacity_score: 98.75776397515527, conditioning_extended_power_score: 66.15384615384615, conditioning_power_score: 54.666666666666664, conditioning_score: 74.33901364336147, work_capacity_score: 53.464999999999996, unit_type: 'imperial')
        
        @squat = @profile.exercises.create!(category: 'strength', name: "Back Squat", value: 355)
        @deadlift = @profile.exercises.create!(category: 'strength', name: "Trap Bar", value: 455)
        @press = @profile.exercises.create!(category: 'strength', name: "Bench Press", value: 275)
        @weighted_pullup = @profile.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: 260)

        @extended_capacity = @profile.exercises.create!(category: 'conditioning', name:'8 mile ruck', value: 120)
        @capacity = @profile.exercises.create!(category: 'conditioning', name:'5 mile run', value: 35.5)
        @extended_power = @profile.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: 10.6967)
        @power = @profile.exercises.create!(category: 'conditioning', name:'400m run', value: 1.896)

        @pushups = @profile.exercises.create!(category: 'work capacity', name:'Pushups', value: 55)
        @pullups = @profile.exercises.create!(category: 'work capacity', name:'Pull-ups', value: 12)
        @hang = @profile.exercises.create!(category: 'work capacity', name:'Hang', value: 1.5)

        visit '/results'
        
        expect(page).to have_content("Conditioning Score: 74")
        expect(page).to have_content("Extended Capacity Score: 78")
        expect(page).to have_content("Capacity Score: 99")
        expect(page).to have_content("Extended Power Score: 66")
        expect(page).to have_content("Power Score: 55")
        expect(page).to have_content("2 hours 0 minutes")
        expect(page).to have_content(@extended_capacity.name)
        expect(page).to have_content("35 minutes 30 seconds")
        expect(page).to have_content(@capacity.name)
        expect(page).to have_content("10 minutes 42 seconds")
        expect(page).to have_content(@extended_power.name)
        expect(page).to have_content("1 minutes 54 seconds")
        expect(page).to have_content(@power.name)
    end 

    it 'should show work capacity results for a sof land contract profile' do
        @profile = @user.profiles.create!(weight: 195.0, track: "sof_land_cont", strength_lower_score: 100.0, strength_upper_score: 97.06959706959707, strength_score: 98.53479853479854, conditioning_extended_capacity_score: 77.77777777777777, conditioning_capacity_score: 98.75776397515527, conditioning_extended_power_score: 66.15384615384615, conditioning_power_score: 54.666666666666664, conditioning_score: 74.33901364336147, work_capacity_score: 53.464999999999996, unit_type: 'imperial')
        
        @squat = @profile.exercises.create!(category: 'strength', name: "Back Squat", value: 355)
        @deadlift = @profile.exercises.create!(category: 'strength', name: "Trap Bar", value: 455)
        @press = @profile.exercises.create!(category: 'strength', name: "Bench Press", value: 275)
        @weighted_pullup = @profile.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: 260)

        @extended_capacity = @profile.exercises.create!(category: 'conditioning', name:'8 mile ruck', value: 120)
        @capacity = @profile.exercises.create!(category: 'conditioning', name:'5 mile run', value: 35.5)
        @extended_power = @profile.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: 10.6967)
        @power = @profile.exercises.create!(category: 'conditioning', name:'400m run', value: 1.896)

        @pushups = @profile.exercises.create!(category: 'work capacity', name:'Pushups', value: 55)
        @pullups = @profile.exercises.create!(category: 'work capacity', name:'Pull-ups', value: 12)
        @hang = @profile.exercises.create!(category: 'work capacity', name:'Hang', value: 1.5)

        visit '/results'
        
        expect(page).to have_content("Work Capacity Score: 53")
        expect(page).to have_content(@pushups.name)
        expect(page).to have_content("55 reps")
        expect(page).to have_content(@pullups.name)
        expect(page).to have_content("12 reps")
        expect(page).to have_content(@hang.name)
        expect(page).to have_content("1 minute(s) 30 seconds")
    end 

     it 'should show results for sof maritime contract profile' do
        @profile = @user.profiles.create!(weight: 195.0, track: "sof_mar_cont", strength_lower_score: 100.0, strength_upper_score: 97.06959706959707, strength_score: 98.53479853479854, conditioning_extended_capacity_score: 77.77777777777777, conditioning_capacity_score: 98.75776397515527, conditioning_extended_power_score: 66.15384615384615, conditioning_power_score: 54.666666666666664, conditioning_score: 74.33901364336147, work_capacity_score: 53.464999999999996, unit_type: 'imperial')
        
        @squat = @profile.exercises.create!(category: 'strength', name: "Back Squat", value: 355)
        @deadlift = @profile.exercises.create!(category: 'strength', name: "Trap Bar", value: 455)
        @press = @profile.exercises.create!(category: 'strength', name: "Bench Press", value: 275)
        @weighted_pullup = @profile.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: 260)

        @extended_capacity = @profile.exercises.create!(category: 'conditioning', name:'8 mile ruck', value: 120)
        @capacity = @profile.exercises.create!(category: 'conditioning', name:'5 mile run', value: 35.5)
        @capacity_swim = @profile.exercises.create!(category: 'conditioning', name:'2000m swim', value: 10.5)
        @extended_power = @profile.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: 10.6967)
        @extended_power_swim = @profile.exercises.create!(category: 'conditioning', name:'500m swim', value: 10.6967)
        @power = @profile.exercises.create!(category: 'conditioning', name:'400m run', value: 1.896)

        @pushups = @profile.exercises.create!(category: 'work capacity', name:'Pushups', value: 55)
        @pullups = @profile.exercises.create!(category: 'work capacity', name:'Pull-ups', value: 12)
        @hang = @profile.exercises.create!(category: 'work capacity', name:'Hang', value: 1.5)

        visit '/results'

        expect(page).to have_content("SOF Maritime Contract Assessment Results")

        expect(page).to have_content("Overall Score: 75")
        expect(page).to have_content("Strength Score: 99")
        expect(page).to have_content("Conditioning Score: 74")
        expect(page).to have_content("Work Capacity Score: 53")
        expect(page).to have_content("2000m swim: 10 minutes 30 seconds")
        expect(page).to have_content("500m swim: 10 minutes 42 seconds")
    end 

    it 'should show results for sof land prep profile' do
        @profile = @user.profiles.create!(weight: 195.0, track: "sof_land_prep", strength_lower_score: 100.0, strength_upper_score: 97.06959706959707, strength_score: 98.53479853479854, conditioning_extended_capacity_score: 77.77777777777777, conditioning_capacity_score: 98.75776397515527, conditioning_extended_power_score: 66.15384615384615, conditioning_power_score: 54.666666666666664, conditioning_score: 74.33901364336147, work_capacity_score: 53.464999999999996, unit_type: 'imperial')
        
        @squat = @profile.exercises.create!(category: 'strength', name: "Back Squat", value: 220)
        @deadlift = @profile.exercises.create!(category: 'strength', name: "Trap Bar", value: 304)
        @press = @profile.exercises.create!(category: 'strength', name: "Bench Press", value: 187)
        @weighted_pullup = @profile.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: 205)

        @extended_capacity = @profile.exercises.create!(category: 'conditioning', name:'8 mile ruck', value: 120)
        @capacity = @profile.exercises.create!(category: 'conditioning', name:'3 Mile Run', value: 27)
        @capacity_swim = @profile.exercises.create!(category: 'conditioning', name:'2000m swim', value: 10.5)
        @extended_power = @profile.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: 12.6967)
        @power = @profile.exercises.create!(category: 'conditioning', name:'400m run', value: 1.896)

        @pushups = @profile.exercises.create!(category: 'work capacity', name:'Pushups', value: 42)
        @pullups = @profile.exercises.create!(category: 'work capacity', name:'Pull-ups', value: 11)
        @hang = @profile.exercises.create!(category: 'work capacity', name:'Hang', value: 1.23)

        visit '/results'

        expect(page).to have_content("SOF Land Prep Assessment Results")
        
        expect(page).to have_content("Overall Score: 75")
        expect(page).to have_content("Strength Score: 99")
        expect(page).to have_content("Conditioning Score: 74")
        expect(page).to have_content("Work Capacity Score: 53")
    end 
end 