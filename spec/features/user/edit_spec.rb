require 'rails_helper'

RSpec.describe 'the user reset password page' do 
    it 'will let you reset your password' do
        visit '/'

        user = User.create!(email: 'test@test.com', password: "test123", password_confirmation: "test123")

        click_on "Forgot your password?"

        expect(current_path).to eq('/password_reset')

        fill_in :email, with: 'test@test.com'

        click_on "Reset Password"

        expect(page).to have_content("Email sent. Check your inbox for the new password")

        expect(current_path).to eq('/')
    end 

    it 'will not let you reset your password if the account does not exist' do
        visit '/'

        user = User.create!(email: 'test@test.com', password: "test123", password_confirmation: "test123")

        click_on "Forgot your password?"

        expect(current_path).to eq('/password_reset')

        fill_in :email, with: 'test123@test.com'

        click_on "Reset Password"

        expect(page).to have_content("That email is not associated with an account")

        expect(current_path).to eq('/password_reset')
    end 
end 