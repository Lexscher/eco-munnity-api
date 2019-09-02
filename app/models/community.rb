class Community < ApplicationRecord
  # Relationships
  belongs_to :user
  has_many :posts, dependent: :destroy

    # Join Tables
  has_many :joined_communities
  has_many :joined_by, through: :joined_communities, source: :user

  # Validations
  validates :name, :description, :user_id, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, length: { in: 3..40 }
  validates :description, length: { in: 5..255, message: "That description may be too long/short." }
  validates :name, format: { with: /\A[a-zA-Z0-9]+\Z/, message: "No special characters, only letters and numbers." }

end
