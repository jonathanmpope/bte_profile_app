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

end 