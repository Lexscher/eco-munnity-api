class Comment < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :post

  # Validations
  validates :content, :user_id, :post_id, presence: true
end
