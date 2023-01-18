require 'rails_helper'

RSpec.describe 'the profiles report page' do 
    before :each do 
        visit '/'

        @user = User.create!(email: 'test@test.com', password: "test123", password_confirmation: "test123")

        password = "test123"
        @email = 'test@test.com'

        fill_in :email, with: @email
        fill_in :password, with: password

        click_on "Login"
    end 

    it 'has a profiles page with some info' do
        @profile1 = @user.profiles.create!(weight: 195.0, track: "sof_land_cont", strength_lower_score: 90.0, strength_upper_score: 87.06959706959707, strength_score: 88.53479853479854, conditioning_extended_capacity_score: 77.77777777777777, conditioning_capacity_score: 88.75776397515527, conditioning_extended_power_score: 66.15384615384615, conditioning_power_score: 54.666666666666664, conditioning_score: 74.33901364336147, work_capacity_score: 53.464999999999996, unit_type: 'imperial')
        
        @squat = @profile1.exercises.create!(category: 'strength', name: "Back Squat", value: 355)
        @deadlift = @profile1.exercises.create!(category: 'strength', name: "Trap Bar", value: 455)
        @press = @profile1.exercises.create!(category: 'strength', name: "Bench Press", value: 275)
        @weighted_pullup = @profile1.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: 260)

        @extended_capacity = @profile1.exercises.create!(category: 'conditioning', name:'8 mile ruck', value: 120)
        @capacity = @profile1.exercises.create!(category: 'conditioning', name:'5 mile run', value: 35.5)
        @extended_power = @profile1.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: 10.6967)
        @power = @profile1.exercises.create!(category: 'conditioning', name:'400m run', value: 1.896)

        @pushups = @profile1.exercises.create!(category: 'work capacity', name:'Pushups', value: 55)
        @pullups = @profile1.exercises.create!(category: 'work capacity', name:'Pull-ups', value: 12)
        @hang = @profile1.exercises.create!(category: 'work capacity', name:'Hang', value: 1.5)

        @profile2 = @user.profiles.create!(weight: 197.0, track: "sof_land_cont", strength_lower_score: 97.0, strength_upper_score: 99.06959706959707, strength_score: 98.53479853479854, conditioning_extended_capacity_score: 87.77777777777777, conditioning_capacity_score: 98.75776397515527, conditioning_extended_power_score: 86.15384615384615, conditioning_power_score: 74.666666666666664, conditioning_score: 94.33901364336147, work_capacity_score: 83.464999999999996, unit_type: 'imperial')
        
        @squat2 = @profile2.exercises.create!(category: 'strength', name: "Back Squat", value: 395)
        @deadlift2 = @profile2.exercises.create!(category: 'strength', name: "Trap Bar", value: 485)
        @press2 = @profile2.exercises.create!(category: 'strength', name: "Bench Press", value: 295)
        @weighted_pullup2 = @profile1.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: 270)

        @extended_capacity2 = @profile2.exercises.create!(category: 'conditioning', name:'8 mile ruck', value: 110)
        @capacity2 = @profile2.exercises.create!(category: 'conditioning', name:'5 mile run', value: 33.5)
        @extended_power2 = @profile2.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: 10.167)
        @power2 = @profile2.exercises.create!(category: 'conditioning', name:'400m run', value: 1.256)

        @pushups2 = @profile1.exercises.create!(category: 'work capacity', name:'Pushups', value: 67)
        @pullups2 = @profile1.exercises.create!(category: 'work capacity', name:'Pull-ups', value: 18)
        @hang2 = @profile1.exercises.create!(category: 'work capacity', name:'Hang', value: 1.99)

        visit '/progress'
       
        expect(page).to have_content('Your Profiles')
        expect(page).to have_content('Each graph shows your progress over time. Hover for details.')
    end 

    it 'has a graph with your total fitness score and strength, conditioning, and work capacity scores' do
        @profile1 = @user.profiles.create!(weight: 195.0, track: "sof_land_cont", strength_lower_score: 90.0, strength_upper_score: 87.06959706959707, strength_score: 88.53479853479854, conditioning_extended_capacity_score: 77.77777777777777, conditioning_capacity_score: 88.75776397515527, conditioning_extended_power_score: 66.15384615384615, conditioning_power_score: 54.666666666666664, conditioning_score: 74.33901364336147, work_capacity_score: 53.464999999999996, unit_type: 'imperial')
        
        @squat = @profile1.exercises.create!(category: 'strength', name: "Back Squat", value: 355)
        @deadlift = @profile1.exercises.create!(category: 'strength', name: "Trap Bar", value: 455)
        @press = @profile1.exercises.create!(category: 'strength', name: "Bench Press", value: 275)
        @weighted_pullup = @profile1.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: 260)

        @extended_capacity = @profile1.exercises.create!(category: 'conditioning', name:'8 mile ruck', value: 120)
        @capacity = @profile1.exercises.create!(category: 'conditioning', name:'5 mile run', value: 35.5)
        @extended_power = @profile1.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: 10.6967)
        @power = @profile1.exercises.create!(category: 'conditioning', name:'400m run', value: 1.896)

        @pushups = @profile1.exercises.create!(category: 'work capacity', name:'Pushups', value: 55)
        @pullups = @profile1.exercises.create!(category: 'work capacity', name:'Pull-ups', value: 12)
        @hang = @profile1.exercises.create!(category: 'work capacity', name:'Hang', value: 1.5)

        @profile2 = @user.profiles.create!(weight: 197.0, track: "sof_land_cont", strength_lower_score: 97.0, strength_upper_score: 99.06959706959707, strength_score: 98.53479853479854, conditioning_extended_capacity_score: 87.77777777777777, conditioning_capacity_score: 98.75776397515527, conditioning_extended_power_score: 86.15384615384615, conditioning_power_score: 74.666666666666664, conditioning_score: 94.33901364336147, work_capacity_score: 83.464999999999996, unit_type: 'imperial')
        
        @squat2 = @profile2.exercises.create!(category: 'strength', name: "Back Squat", value: 395)
        @deadlift2 = @profile2.exercises.create!(category: 'strength', name: "Trap Bar", value: 485)
        @press2 = @profile2.exercises.create!(category: 'strength', name: "Bench Press", value: 295)
        @weighted_pullup2 = @profile1.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: 270)

        @extended_capacity2 = @profile2.exercises.create!(category: 'conditioning', name:'8 mile ruck', value: 110)
        @capacity2 = @profile2.exercises.create!(category: 'conditioning', name:'5 mile run', value: 33.5)
        @extended_power2 = @profile2.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: 10.167)
        @power2 = @profile2.exercises.create!(category: 'conditioning', name:'400m run', value: 1.256)

        @pushups2 = @profile1.exercises.create!(category: 'work capacity', name:'Pushups', value: 67)
        @pullups2 = @profile1.exercises.create!(category: 'work capacity', name:'Pull-ups', value: 18)
        @hang2 = @profile1.exercises.create!(category: 'work capacity', name:'Hang', value: 1.99)

        visit '/progress'

        expect(page).to have_content('Profile and Category Scores Over Time')
    end 

     it 'has an overview of all profiles with the name of the track, date, and link' do
        @profile1 = @user.profiles.create!(weight: 195.0, track: "sof_land_cont", strength_lower_score: 90.0, strength_upper_score: 87.06959706959707, strength_score: 88.53479853479854, conditioning_extended_capacity_score: 77.77777777777777, conditioning_capacity_score: 88.75776397515527, conditioning_extended_power_score: 66.15384615384615, conditioning_power_score: 54.666666666666664, conditioning_score: 74.33901364336147, work_capacity_score: 53.464999999999996, unit_type: 'imperial')
        
        @squat = @profile1.exercises.create!(category: 'strength', name: "Back Squat", value: 355)
        @deadlift = @profile1.exercises.create!(category: 'strength', name: "Trap Bar", value: 455)
        @press = @profile1.exercises.create!(category: 'strength', name: "Bench Press", value: 275)
        @weighted_pullup = @profile1.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: 260)

        @extended_capacity = @profile1.exercises.create!(category: 'conditioning', name:'8 mile ruck', value: 120)
        @capacity = @profile1.exercises.create!(category: 'conditioning', name:'5 mile run', value: 35.5)
        @extended_power = @profile1.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: 10.6967)
        @power = @profile1.exercises.create!(category: 'conditioning', name:'400m run', value: 1.896)

        @pushups = @profile1.exercises.create!(category: 'work capacity', name:'Pushups', value: 55)
        @pullups = @profile1.exercises.create!(category: 'work capacity', name:'Pull-ups', value: 12)
        @hang = @profile1.exercises.create!(category: 'work capacity', name:'Hang', value: 1.5)

        @profile2 = @user.profiles.create!(weight: 197.0, track: "sof_land_cont", strength_lower_score: 97.0, strength_upper_score: 99.06959706959707, strength_score: 98.53479853479854, conditioning_extended_capacity_score: 87.77777777777777, conditioning_capacity_score: 98.75776397515527, conditioning_extended_power_score: 86.15384615384615, conditioning_power_score: 74.666666666666664, conditioning_score: 94.33901364336147, work_capacity_score: 83.464999999999996, unit_type: 'imperial')
        
        @squat2 = @profile2.exercises.create!(category: 'strength', name: "Back Squat", value: 395)
        @deadlift2 = @profile2.exercises.create!(category: 'strength', name: "Trap Bar", value: 485)
        @press2 = @profile2.exercises.create!(category: 'strength', name: "Bench Press", value: 295)
        @weighted_pullup2 = @profile1.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: 270)

        @extended_capacity2 = @profile2.exercises.create!(category: 'conditioning', name:'8 mile ruck', value: 110)
        @capacity2 = @profile2.exercises.create!(category: 'conditioning', name:'5 mile run', value: 33.5)
        @extended_power2 = @profile2.exercises.create!(category: 'conditioning', name:'1.5 mile run', value: 10.167)
        @power2 = @profile2.exercises.create!(category: 'conditioning', name:'400m run', value: 1.256)

        @pushups2 = @profile1.exercises.create!(category: 'work capacity', name:'Pushups', value: 67)
        @pullups2 = @profile1.exercises.create!(category: 'work capacity', name:'Pull-ups', value: 18)
        @hang2 = @profile1.exercises.create!(category: 'work capacity', name:'Hang', value: 1.99)

        visit '/progress'

        expect(page).to have_content('Your Profiles')
        expect(page).to have_content('SOF Land Contract')
    end 
end 