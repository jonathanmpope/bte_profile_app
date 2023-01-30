class User < ApplicationRecord
    has_many :profiles
    has_many :exercises, through: :profiles


    # password_requirements = /\A 
    #     (?=.{6,}) #has to be 6 characters 
    #     (?=.*\d) # has to conatin at least one number
    #     (?=.*\[a-zA-Z]) # has to conatin at least on letter 
    # /x

    validates :email, uniqueness: true, presence: true
    validates_presence_of :password, confirmation: true 
    validates :password, length: { in: 6..10 }
    # validates :password, format: { with: password_requirements, message: "Your password does not meet password requirements" }
    validates :password_confirmation, presence: true

    has_secure_password

    def self.search_by_email(search_phrase)
        where("email ILIKE ?", "%#{search_phrase}%")[0]
    end 

    def goblet_squat_movements
        profiles.joins(:exercises).where(exercises: {name: "Goblet Squat"})
        .select('exercises.*')
    end

    def front_squat_movements
        profiles.joins(:exercises).where(exercises: {name: "Front Squat"})
        .select('exercises.*')
    end 

    def back_squat_movements 
        profiles.joins(:exercises).where(exercises: {name: "Back Squat"})
        .select('exercises.*')
    end 

    def trap_bar_movements
        profiles.joins(:exercises).where(exercises: {name: "Trap Bar"})
        .select('exercises.*')
    end 

    def straight_bar_movements
        profiles.joins(:exercises).where(exercises: {name: "Straight Bar"})
        .select('exercises.*')
    end 
end