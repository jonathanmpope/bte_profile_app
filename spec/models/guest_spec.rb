require 'rails_helper'

RSpec.describe User, type: :model do 
    describe 'relationships' do
    end 

    describe 'validations' do 
        it { should validate_presence_of :weight }
    end 
end 