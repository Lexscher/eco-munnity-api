class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content

  attribute :user do |post| post.user end

  attribute :community do |post| post.community end

  attribute :comments do |post| post.comments end

  attribute :votes do |post| post.voted_posts end

  attribute :voters do |post| post.voted_by end

  attribute :created do |post| post.created_at end
    
  attribute :updated do |post| post.updated_at end

end
