class User < ApplicationRecord
  has_secure_password

  # Relationships
  has_many :communities

  # Validations
  validates :first_name, :last_name, :username, :email, :password, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }
  validates :username, length: { in: 2..15, message: "That name may be too long or too short." }
  validates :password, length: { minimum: 5, message: "Password must have at least 5 characters" }
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/, message: "No special characters, only letters and numbers." }

  # custom methods
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
