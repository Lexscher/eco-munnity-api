class VotedPost < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :post

  # Validations
  validates :state, :user_id, :post_id, presence: true
  validates :user_id, uniqueness: {
    scope: :post_id,
    message: "You can only vote on a post once!!"
  }
end
