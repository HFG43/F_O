class User < ApplicationRecord
  has_secure_password :password
  belongs_to :family
  has_one_attached :profile_image
  
  attr_accessor :password_digest

  #revisar format validation
  # validates :profile_image, format: { with: /\.(png|jpeg|jpg|gif)\z/i, message: "Image format not valid" }
  validates :name, presence: true, uniqueness: { message: "A user is already registered with this name: %{value}" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { message: "The email adress is already registered" }
  validate :birthday_is_valid

  private
    def birthday_is_valid
      if birthday > DateTime.now
        errors.add(:birthday, "Birthday date can only before this day, or today")
      end
    end
end
