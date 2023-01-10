require 'rails_helper'

RSpec.describe 'the threshold page' do 

     it 'has a page to input heart rate zones' do
         visit '/zones'

         expect(page).to have_content('Calculate your Heart Rate Zones')
         expect(page).to have_content('Input your average heart rate over your threshold test')
     end 

     it 'has a form to convert heart rate zones' do
         visit '/zones'
    
         fill_in("heartrate", with:180)
         click_button("Calculate Zones")
        
         expect(current_path).to eq('/zones')
         expect(page).to have_content('108')
         expect(page).to have_content('126')
         expect(page).to have_content('144')
         expect(page).to have_content('162')
         expect(page).to have_content('180')
     end

end 