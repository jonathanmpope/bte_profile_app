require 'rails_helper'

RSpec.describe 'the landing page' do 
    before :each do 
        visit '/'

        @user = User.create!(email: 'test@test.com', password: "test123", password_confirmation: "test123", admin: true)

        password = "test123"
        @email = 'test@test.com'

        fill_in :email, with: @email
        fill_in :password, with: password

        click_on "Login"
    end 

     it 'has an admin page' do
        visit '/admin'

        expect(page).to have_content("Welcome test@test.com")
     end 

     it 'has an admin page with results' do
        @user2 = User.create!(email: 'test2@test.com', password: "test123", password_confirmation: "test123", admin: true)
        @profile1 = @user2.profiles.create!(weight: 195.0, track: "sof_land_cont", strength_lower_score: 100.0, strength_upper_score: 97.06959706959707, strength_score: 98.53479853479854, conditioning_extended_capacity_score: 77.77777777777777, conditioning_capacity_score: 98.75776397515527, conditioning_extended_power_score: 66.15384615384615, conditioning_power_score: 54.666666666666664, conditioning_score: 74.33901364336147, work_capacity_score: 53.464999999999996, unit_type: 'imperial')
        @profile2 = @user2.profiles.create!(weight: 195.0, track: "operator_short", strength_lower_score: 90.0, strength_upper_score: 91.06959706959707, strength_score: 78.53479853479854, conditioning_extended_capacity_score: 57.77777777777777, conditioning_capacity_score: 68.75776397515527, conditioning_extended_power_score: 56.15384615384615, conditioning_power_score: 34.666666666666664, conditioning_score: 64.33901364336147, work_capacity_score: 83.464999999999996, unit_type: 'imperial')
        
        visit '/admin'
        
        expect(page).to have_content("test2@test.com")
        expect(page).to have_content("SOF Land Contract")
        expect(page).to have_content("Operator(short)")
     end 

     

    it 'has an admin page with search results' do
        @user2 = User.create!(email: 'test2@test.com', password: "test123", password_confirmation: "test123")
        @user3 = User.create!(email: 'test3@test.com', password: "test123", password_confirmation: "test123")
        @profile1 = @user2.profiles.create!(weight: 195.0, track: "sof_land_cont", strength_lower_score: 100.0, strength_upper_score: 97.06959706959707, strength_score: 98.53479853479854, conditioning_extended_capacity_score: 77.77777777777777, conditioning_capacity_score: 98.75776397515527, conditioning_extended_power_score: 66.15384615384615, conditioning_power_score: 54.666666666666664, conditioning_score: 74.33901364336147, work_capacity_score: 53.464999999999996, unit_type: 'imperial')
        @profile2 = @user3.profiles.create!(weight: 195.0, track: "operator_short", strength_lower_score: 90.0, strength_upper_score: 91.06959706959707, strength_score: 78.53479853479854, conditioning_extended_capacity_score: 57.77777777777777, conditioning_capacity_score: 68.75776397515527, conditioning_extended_power_score: 56.15384615384615, conditioning_power_score: 34.666666666666664, conditioning_score: 64.33901364336147, work_capacity_score: 83.464999999999996, unit_type: 'imperial')
        
        visit '/admin'

        fill_in 'Search', with: "test2@test.com"
        click_on("Search")
        
        expect(page).to have_content("test2@test.com")
        expect(page).to have_content("SOF Land Contract")
        expect(page).to_not have_content("Operator(short)")
        expect(page).to_not have_content("test3@test.com")
     end 
end 