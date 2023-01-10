require 'rails_helper'

RSpec.describe 'the threshold page' do 
    before :each do 
        visit '/'

        @user = User.create!(email: 'test@test.com', password: "test123", password_confirmation: "test123")

        password = "test123"
        @email = 'test@test.com'

        fill_in :email, with: @email
        fill_in :password, with: password

        click_on "Login"
    end 

     it 'has a page to input threshold pacing' do
         visit '/threshold'

         expect(page).to have_content('Calculate your Running Paces for Training')
         expect(page).to have_content('Input your average pace over your threshold test below')
     end 

     it 'has a form to convert threshold' do
         visit '/threshold'
        
         choose(id="units_imperial")
         fill_in("minutes", with:8)
         fill_in("seconds", with:30)
         click_button("Convert to Pacing")
        
         expect(current_path).to eq('/threshold')
     end

     it 'converts imperial pacing' do
         visit '/threshold'
        
         choose(id="units_imperial")
         fill_in("minutes", with:8)
         fill_in("seconds", with:30)
         click_button("Convert to Pacing")
        
         expect(current_path).to eq('/threshold')

         expect(page).to have_content('9 minutes, 30 seconds')
         expect(page).to have_content('9 minutes, 0 seconds')
         expect(page).to have_content('8 minutes, 30 seconds')
         expect(page).to have_content('8 minutes, 0 seconds')
         expect(page).to have_content('7 minutes, 45 seconds')
         expect(page).to have_content('7 minutes, 15 seconds')
     end

end 