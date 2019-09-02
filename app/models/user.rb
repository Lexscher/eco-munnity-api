class User < ApplicationRecord
  has_secure_password

  # Relationships
  has_many :communities
  # Post user created within a community, NOT a post that belongs to user's community.
  has_many :posts
  has_many :comments

    # Join Tables
  has_many :joined_communities
  has_many :joined, through: :joined_communities, source: :community

  # For these two groups:
      # user.voted = [List Of POSTS the user voted on]
  has_many :voted_posts
  has_many :voted, through: :voted_posts, source: :post
      # user.votes = [List Of COMMENTS the user voted on]
  has_many :voted_comments
  has_many :votes, through: :voted_comments, source: :comment


  # Validations
  validates :first_name, :last_name, :username, :email, :password, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }
  validates :username, length: { in: 2..15, message: "That name may be too long or too short." }
  validates :password, length: { minimum: 5, message: "Password must have at least 5 characters" }
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/, message: "No special characters, only letters and numbers." }

  # custom methods
  # Full name of the user
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
end
