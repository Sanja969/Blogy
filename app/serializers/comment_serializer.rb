class CommentSerializer < ActiveModel::Serializer
  attributes :id, :Text, :Author_id
end
