require 'rails_helper'

RSpec.describe 'the landing page' do 
    it 'should be a page with several options' do
        visit '/'

        expect(page).to have_content("BTE Profile Generator")
        expect(page).to have_content("Create an Account")
        expect(page).to have_content("Create Profile Without an Account")
        expect(page).to have_content("Already have an account?")
    end  
end 