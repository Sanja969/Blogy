class PostSerializer < ActiveModel::Serializer
  attributes :id, :Title, :Text
  has_many :comments
end
