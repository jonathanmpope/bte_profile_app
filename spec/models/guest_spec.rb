require 'rails_helper'

RSpec.describe Guest, type: :model do 
    describe 'relationships' do
        # it { should have_one :profile }
    end 

    describe 'validations' do 
        it { should validate_presence_of :weight }
    end 
end 