class CommunitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description

  attribute :user do |community| community.user end

  attribute :community do |community| community.community end
  
  attribute :posts do |community| community.posts end
  
  attribute :joined do |community| community.joined_communities end
  
  attribute :members do |community| community.joined_by end
  
  attribute :created do |community| community.created_at end
      
  attribute :updated do |community| community.updated_at end
  
end
