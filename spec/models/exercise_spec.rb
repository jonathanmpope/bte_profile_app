require 'rails_helper'

RSpec.describe Exercise, type: :model do 
    describe 'relationships' do
        it { should belong_to :profile }
    end 

    describe 'validations' do 
        it { should validate_presence_of :category }
        it { should validate_presence_of :name }
        it { should validate_presence_of :value }
    end 
end 