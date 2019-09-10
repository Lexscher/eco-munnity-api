class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content

  attribute :user do |comment| comment.user end

  attribute :post do |comment| comment.post end

  attribute :votes do |comment| comment.voted_comments end

  attribute :voters do |comment| comment.voted_by end

  attribute :created do |comment| comment.created_at end
    
  attribute :updated do |comment| comment.updated_at end
end
