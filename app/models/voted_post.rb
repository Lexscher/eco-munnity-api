class VotedPost < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :post
  
  # Validations
  validates :user_id, :post_id, presence: true
  validates :user_id, uniqueness: {
    scope: :post_id,
    message: "You can only vote on a post once!!"
  }

  # Custom Validations
  validate :state_is_not_nil

  def state_is_not_nil
    self.errors.add(:state, "State can't be nil.") if state == nil 
  end
  
end
