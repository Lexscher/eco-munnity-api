class Post < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :community

  # Validations
  validates :title, :content, :user_id, :community_id, presence: true
  validates :title, length: { in: 2..255 }
  validates :content, length: { minimum: 3 }
end
