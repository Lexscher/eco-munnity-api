class JoinedCommunity < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :community

  # Validations 
  validates :user_id, :community_id, presence: true
  validates :user_id, uniqueness: { scope: :community_id,  message: "You can only join a community once!!" }
end
