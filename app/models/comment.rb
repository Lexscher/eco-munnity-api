class Comment < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :post

    # Join Table
  has_many :voted_comments
  has_many :voted_by, through: :voted_comments, source: :user

  # Validations
  validates :content, :user_id, :post_id, presence: true
end
