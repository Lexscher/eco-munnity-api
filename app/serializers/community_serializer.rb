class CommunitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description
end
