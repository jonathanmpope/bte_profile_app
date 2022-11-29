require 'rails_helper'

RSpec.describe 'the user create account page' do 
    it 'will let you create an account' do
        visit '/users/new'

        password = "test"
        email = 'test@test.com'

        fill_in :user_email, with: email
        fill_in :user_password, with: password
        fill_in :user_password_confirmation, with: password

        click_on "Create Account"

        expect(page).to have_content("Welcome, #{email}!")
        expect(current_path).to eq("/profile")
    end
end 