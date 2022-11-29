require 'rails_helper'

RSpec.describe User, type: :model do 
    describe 'relationships' do
        it { should have_many :profiles }
    end 

    describe 'validations' do 
        it { should validate_presence_of :email }
        it { should validate_presence_of :weight }
        it { should validate_presence_of :password }
        it { should have_secure_password }
    end 
end 