class Profile < ApplicationRecord
    belongs_to :user
    has_many :exercises, dependent: :delete_all

    validates_presence_of :weight
    validates_presence_of :track
    validates_presence_of :strength_lower_score
    validates_presence_of :strength_upper_score
    # validates_presence_of :power_score
    validates_presence_of :strength_score 
    validates_presence_of :conditioning_extended_capacity_score
    validates_presence_of :conditioning_capacity_score
    validates_presence_of :conditioning_extended_power_score
    validates_presence_of :conditioning_power_score
    validates_presence_of :conditioning_score
    validates_presence_of :work_capacity_score
    validates_presence_of :unit_type

    def self.find_by_user(user_id)
        where(user_id: user_id)
    end 
end