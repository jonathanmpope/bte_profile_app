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
    end 

    it 'should be a page with several options and lets you select a track' do
        expect(page).to have_content("Welcome, #{@email}!")
        expect(current_path).to eq("/profile")

        select("SOF Land Contract", from: "track")  

        click_button("Select Track")
        
        expect(page).to have_content("SOF Land Contract Assessments")
    end 

     it 'should be a page with several options and lets you select a track' do
        select("SOF Land Contract", from: "track")  
        click_button("Select Track")
        
        expect(page).to have_content("SOF Land Contract Assessments")

        fill_in("ruck_hours", with:2)
        fill_in("ruck_minutes", with:15)
        fill_in("five_mile_minutes", with:40)
        fill_in("five_mile_seconds", with:15)
        fill_in("one_and_half_mile_run_minutes", with:10)
        fill_in("one_and_half_mile_run_seconds", with:50)
        fill_in("four_hundred_run_minutes", with:1)
        fill_in("four_hundred_run_seconds", with:30)
        fill_in("pushup_reps", with:50)
        fill_in("pullup_reps", with:12)
        fill_in("hang_minutes", with:1)
        fill_in("hang_seconds", with:19)
        choose(id="units_imperial")
        fill_in("body_weight", with:195)
        select("Back Squat", from: "squat")
        fill_in("squat_weight", with:395) 
        select("Trap Bar", from: "deadlift")
        fill_in("deadlift_weight", with:475)  
        select("Bench Press", from: "press")
        fill_in("press_weight", with:275)
        fill_in("pullup_weight", with:265)
        click_button("Submit Results")

        expect(current_path).to eq("/results")
        expect(page).to have_content("SOF Land Contract Assessment Results")
    end 

     it 'should be a page with several options and lets you select sof maritime contract track' do
        select("SOF Maritime Contract", from: "track")  
        click_button("Select Track")
        
        expect(page).to have_content("SOF Maritime Contract Assessments")

        fill_in("ruck_hours", with:2)
        fill_in("ruck_minutes", with:15)
        fill_in("five_mile_minutes", with:40)
        fill_in("five_mile_seconds", with:15)
        fill_in("two_thousand_swim_minutes", with:40)
        fill_in("two_thousand_swim_seconds", with:15)
        fill_in("one_and_half_mile_run_minutes", with:10)
        fill_in("one_and_half_mile_run_seconds", with:50)
        fill_in("five_hundred_swim_minutes", with:11)
        fill_in("five_hundred_swim_seconds", with:50)
        fill_in("four_hundred_run_minutes", with:1)
        fill_in("four_hundred_run_seconds", with:30)
        fill_in("pushup_reps", with:50)
        fill_in("pullup_reps", with:12)
        fill_in("hang_minutes", with:1)
        fill_in("hang_seconds", with:19)
        choose(id="units_imperial")
        fill_in("body_weight", with:195)
        select("Back Squat", from: "squat")
        fill_in("squat_weight", with:395) 
        select("Trap Bar", from: "deadlift")
        fill_in("deadlift_weight", with:475)  
        select("Bench Press", from: "press")
        fill_in("press_weight", with:275)
        fill_in("pullup_weight", with:265)
        click_button("Submit Results")

        expect(current_path).to eq("/results")
        expect(page).to have_content("SOF Maritime Contract Assessment Results")
    end 

    it 'should be a page with several options and lets you select sof land prep track' do
        select("SOF Land Prep", from: "track")  
        click_button("Select Track")
        
        expect(page).to have_content("SOF Land Prep Assessments")
        select("3 Mile Run", from: "prep_run_or_ruck")
        fill_in("ruck_or_run_hours", with:0)
        fill_in("ruck_or_run_minutes", with:30)
        fill_in("one_and_half_mile_run_minutes", with:12)
        fill_in("one_and_half_mile_run_seconds", with:50)
        fill_in("four_hundred_run_minutes", with:1)
        fill_in("four_hundred_run_seconds", with:30)
        fill_in("pushup_reps", with:50)
        fill_in("pullup_reps", with:9)
        fill_in("hang_minutes", with:1)
        fill_in("hang_seconds", with:19)
        choose(id="units_imperial")
        fill_in("body_weight", with:195)
        select("Back Squat", from: "squat")
        fill_in("squat_weight", with:266) 
        select("Trap Bar", from: "deadlift")
        fill_in("deadlift_weight", with:303)  
        select("Bench Press", from: "press")
        fill_in("press_weight", with:194)
        fill_in("pullup_weight", with:215)
        click_button("Submit Results")

        expect(current_path).to eq("/results")
        expect(page).to have_content("SOF Land Prep Assessment Results")
    end 

    it 'should be a page with several options and lets you select sof maritime prep track' do
        select("SOF Maritime Prep", from: "track")  
        click_button("Select Track")
        
        expect(page).to have_content("SOF Maritime Prep Assessments")
        select("3 Mile Run", from: "prep_run_or_ruck")
        fill_in("ruck_or_run_hours", with:0)
        fill_in("ruck_or_run_minutes", with:30)
        fill_in("one_and_half_mile_run_minutes", with:12)
        fill_in("one_and_half_mile_run_seconds", with:50)
        fill_in("five_hundred_swim_minutes", with:11)
        fill_in("five_hundred_swim_seconds", with:50)
        fill_in("four_hundred_run_minutes", with:1)
        fill_in("four_hundred_run_seconds", with:30)
        fill_in("pushup_reps", with:50)
        fill_in("pullup_reps", with:9)
        fill_in("hang_minutes", with:1)
        fill_in("hang_seconds", with:19)
        choose(id="units_imperial")
        fill_in("body_weight", with:195)
        select("Back Squat", from: "squat")
        fill_in("squat_weight", with:266) 
        select("Trap Bar", from: "deadlift")
        fill_in("deadlift_weight", with:303)  
        select("Bench Press", from: "press")
        fill_in("press_weight", with:194)
        fill_in("pullup_weight", with:215)
        click_button("Submit Results")

        expect(current_path).to eq("/results")
        expect(page).to have_content("SOF Maritime Prep Assessment Results")
    end 
end 