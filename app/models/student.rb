class Student < ApplicationRecord

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :school_email, presence: true, uniqueness: true
    validates :major, presence: true
    validates :graduation_date, presence: true

    has_one_attached :profile_pic, dependent: :purge_later
    validate :acceptable_image

    def acceptable_image
        return unless profile_pic.attached?
 
        unless profile_pic.blob.byte_size <= 1.megabyte
            errors.add(:profile_pic, "is too big")
        end
 
        acceptable_types = ["image/jpeg", "image/png"]
        unless acceptable_types.include?(profile_pic.content_type)
            errors.add(:profile_pic, "must be a JPEG or PNG")
        end
 
  end
 
    
    VALID_MAJORS = ["Computer Engineering BS", "Computer Information Systems BS", "Computer Science BS", "Cybersecurity Major",
"Data Science and Machine Learning Major"]

    validates :major, inclusion: { in: VALID_MAJORS, message: "%{value} is not a valid major" }
end

