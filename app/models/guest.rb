class Guest < ApplicationRecord
    # has_one :profile 

    validates_presence_of :weight
end 