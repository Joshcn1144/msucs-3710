class Student < ApplicationRecord

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :school_email, presence: true, uniqueness: true
    validates :major, presence: true
    validates :graduation_date, presence: true

    has_one_attached :profile_pic
    
end
