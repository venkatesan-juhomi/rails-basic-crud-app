class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validate :is_email_format_valid?


  def is_email_format_valid?
    return false if email.blank?
    result = (email =~ VALID_EMAIL_REGEX)
    errors.add(:user, "Invalid email format.") if result != 0
  end
end
