class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content

  belongs_to :community
  belongs_to :user

  attribute :comments do |post|
    post.comments
  end

  attribute :votes do |post|
    post.voted_posts
  end

  attribute :voters do |post|
    post.voted_by
  end

end
