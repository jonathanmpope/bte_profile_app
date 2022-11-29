require 'rails_helper'

RSpec.describe 'the landing page' do 
    it 'should be a page with several options' do
        visit '/'

        user = User.create!(email: 'test@test.com', password: "test", password_confirmation: "test")

        password = "test"
        email = 'test@test.com'

        fill_in :email, with: email
        fill_in :password, with: password

        click_on "Login"

        expect(page).to have_content("Welcome, #{email}!")
        expect(current_path).to eq("/profile")

        select("SOF Land Contract", from: "track")  

        click_button("Select Track")
        
        expect(page).to have_content("SOF Land Contract Assessments")
    end 
end 