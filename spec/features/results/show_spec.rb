require 'rails_helper'

RSpec.describe 'the landing page' do 
    before :each do 
        visit '/'

        user = User.create!(email: 'test@test.com', password: "test", password_confirmation: "test")

        password = "test"
        @email = 'test@test.com'

        fill_in :email, with: @email
        fill_in :password, with: password

        click_on "Login"

        @profile = user.profiles.create!(weight: 195.0, track: "sof_land_cont", strength_lower_score: 100.0, strength_upper_score: 97.06959706959707, strength_score: 98.53479853479854, conditioning_extended_capacity_score: 77.77777777777777, conditioning_capacity_score: 98.75776397515527, conditioning_extended_power_score: 66.15384615384615, conditioning_power_score: 54.666666666666664, conditioning_score: 74.33901364336147, work_capacity_score: 53.464999999999996)
        @squat = @profile.exercises.create!(category: 'strength', name: "Back Squat", value: 355)
        @deadlift = @profile.exercises.create!(category: 'strength', name: "Trap Bar", value: 455)
        @press = @profile.exercises.create!(category: 'strength', name: "Bench Press", value: 275)
        @weighted_pullup = @profile.exercises.create!(category: 'strength', name: "Weighted Pull-up", value: 260)
    end 

    it 'should be a page with several options and lets you select a track' do
        visit '/results'
        expect(page).to have_content("SOF Land Contract Assessment Results")
        expect(page).to have_content("Overall Score: 75")
        expect(page).to have_content("Lower Body: 100")
        expect(page).to have_content("Upper Body: 97")
        expect(page).to have_content(@squat.value.to_i)
        expect(page).to have_content(@squat.name)
        expect(page).to have_content(@deadlift.value.to_i)
        expect(page).to have_content(@deadlift.name)
        expect(page).to have_content(@press.value.to_i)
        expect(page).to have_content(@press.name)
        expect(page).to have_content(@weighted_pullup.value.to_i)
        expect(page).to have_content(@weighted_pullup.name)
    end 
end 