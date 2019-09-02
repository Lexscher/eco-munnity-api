class VotedComment < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :comment

  # Validations
  validates :user_id, :comment_id, presence: true
  validates :user_id, uniqueness: {
    scope: :comment_id,
    message: "You can only vote on a comment once!!"
  }

  # Custom Validations
  validate :state_is_not_nil

  def state_is_not_nil
    self.errors.add(:state, "State can't be nil.") if state == nil 
  end
end
