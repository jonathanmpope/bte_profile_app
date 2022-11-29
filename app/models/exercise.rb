class Exercise < ApplicationRecord
    belongs_to :profile 
    
    validates_presence_of :type
    validates_presence_of :name
    validates_presence_of :value
end 