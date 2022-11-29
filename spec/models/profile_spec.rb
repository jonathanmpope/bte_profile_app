require 'rails_helper'

RSpec.describe Profile, type: :model do 
    describe 'relationships' do
        it { should belong_to :user }
    end 

    describe 'validations' do 
        it { should validate_presence_of :type }
        it { should validate_presence_of :strength_lower_score }
        it { should validate_presence_of :strength_upper_score }
        it { should validate_presence_of :power_score }
        it { should validate_presence_of :strength_score }
        it { should validate_presence_of :conditioning_extended_capacity_score }
        it { should validate_presence_of :conditioning_capacity_score }
        it { should validate_presence_of :conditioning_extended_power_score }
        it { should validate_presence_of :conditioning_power_score }
        it { should validate_presence_of :conditioning_score }
        it { should validate_presence_of :work_capacity_score }
    end 
end 