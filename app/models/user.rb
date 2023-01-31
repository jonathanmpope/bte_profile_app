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
    
    def bench_press_movements
        profiles.joins(:exercises).where(exercises: {name: "Bench Press"})
        .select('exercises.*')
    end 

    def overhead_press_movements
        profiles.joins(:exercises).where(exercises: {name: "Overhead Press (1 Arm)"})
        .select('exercises.*')
    end 

    def db_bench_press_movements
        profiles.joins(:exercises).where(exercises: {name: "DB Bench Press"})
        .select('exercises.*')
    end 

    def db_row_movements
        profiles.joins(:exercises).where(exercises: {name: "3 Point Row"})
        .select('exercises.*')
    end

    def weighted_pullup_movements
        profiles.joins(:exercises).where(exercises: {name: "Weighted Pull-up"})
        .select('exercises.*')
    end

    def pullup_movements
        profiles.joins(:exercises).where(exercises: {name: "Pull-ups"})
        .select('exercises.*')
    end

    def pushup_movements
        profiles.joins(:exercises).where(exercises: {name: "Pushups"})
        .select('exercises.*')
    end

    def dip_movements
        profiles.joins(:exercises).where(exercises: {name: "Dips"})
        .select('exercises.*')
    end

    def hang_movements
        profiles.joins(:exercises).where(exercises: {name: "Hang"})
        .select('exercises.*')
    end
end