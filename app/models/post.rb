class Post < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :community

  has_many :comments, dependent: :destroy
  
    # Join Tables
  has_many :voted_posts
  has_many :voted_by, through: :voted_posts, source: :user

  # Validations
  validates :title, :content, :user_id, :community_id, presence: true
  validates :title, length: { in: 2..255 }
  validates :content, length: { minimum: 3 }
end
