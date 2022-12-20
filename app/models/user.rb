class User < ApplicationRecord
    has_many :profiles

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
end