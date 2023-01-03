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

     it 'has a page with profiles' do
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

        click_on("My Profiles")
        
        expect(current_path).to eq("/profiles")
        expect(page).to have_content("Your Profiles")
        expect(page).to have_content("SOF Land Contract")
    end 

end 