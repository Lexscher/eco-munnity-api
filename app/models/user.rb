class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :username, :email, :password, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }
  validates :username, length: { in: 2..15 }
  validates :password, length: { minimum: 5 }
end
