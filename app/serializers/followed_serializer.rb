class FollowedSerializer < ActiveModel::Serializer
  attributes :id, :name, :external_url, :genres, :image_url, :total_followers
end
