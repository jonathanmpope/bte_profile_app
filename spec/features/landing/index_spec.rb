require 'rails_helper'

RSpec.describe 'the landing page' do 
    it 'should be a page with several options' do
        visit '/'

        expect(page).to have_content("BTE Profile Generator")
        expect(page).to have_content("Create an Account")
        expect(page).to have_content("Already have an account?")
    end  

    it 'will let you login' do
        visit '/'

        user = User.create!(email: 'test@test.com', password: "test")

        password = "test"
        email = 'test@test.com'

        fill_in :email, with: email
        fill_in :password, with: password

        click_on "Login"

        expect(page).to have_content("Welcome, #{email}!")
        expect(current_path).to eq("/profile")
    end

    it 'will not let you login without valid credentials' do
        visit '/'

        user = User.create!(email: 'test@test.com', password: "test")

        password = "test1"
        email = 'test@test.com'

        fill_in :email, with: email
        fill_in :password, with: password

        click_on "Login"

        expect(page).to have_content("Sorry, your credentials are bad")
        expect(current_path).to eq("/")
    end

     it 'will let you logout' do
        visit '/'

        user = User.create!(email: 'test@test.com', password: "test")

        password = "test"
        email = 'test@test.com'

        fill_in :email, with: email
        fill_in :password, with: password

        click_on "Login"

        expect(page).to have_content("Welcome, #{email}!")
        expect(current_path).to eq("/profile")

        visit '/'
        
        expect(page).to have_content("You're logged in")
        expect(page).to have_content("Profile")

        click_on "Logout"

        expect(page).to_not have_content("You're logged in")
    end
end 