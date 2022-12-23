require 'rails_helper'

RSpec.describe 'the user create account page' do 
    it 'will let you create an account' do
        visit '/users/new'

        password = 'test123'
        email = 'test@test.com'

        fill_in :email, with: email
        fill_in :password, with: password
        fill_in :password_confirmation, with: password

        click_on "Create Account"

        expect(page).to have_content("Welcome, #{email}!")
        expect(current_path).to eq("/profile")
    end

    it 'will not you create an account if passwords do not match' do
        visit '/users/new'

        password = "test123"
        password1 = "test11222"
        email = 'test@test.com'

        fill_in :email, with: email
        fill_in :password, with: password
        fill_in :password_confirmation, with: password1

        click_on "Create Account"

        expect(page).to have_content("Password confirmation doesn't match Password")
        expect(current_path).to eq("/users/new")
    end

    it 'will not you create an account if passwords are not six characters long' do
        visit '/users/new'

        password = "test"
        email = 'test@test.com'

        fill_in :email, with: email
        fill_in :password, with: password
        fill_in :password_confirmation, with: password

        click_on "Create Account"
        
        expect(page).to have_content("Password is too short (minimum is 6 characters)")
        expect(current_path).to eq("/users/new")
    end
end 