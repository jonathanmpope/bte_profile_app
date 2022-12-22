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
end 