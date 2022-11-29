class User < ApplicationRecord
    has_many :profiles

    validates :email, uniqueness: true, presence: true
    validates_presence_of :password
    validates_presence_of :weight

    has_secure_password
end