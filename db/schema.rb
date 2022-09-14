# ActiveRecord::Schema[7.0].define(version: 2022_09_14_095836) do
#   enable_extension 'plpgsql'

#   create_table 'comments', force: :cascade do |t|
#     t.integer 'AuthorId'
#     t.integer 'PostId'
#     t.text 'Text'
#     t.datetime 'created_at', null: false
#     t.datetime 'updated_at', null: false
#   end

#   create_table 'likes', force: :cascade do |t|
#     t.integer 'AuthorId'
#     t.integer 'PostId'
#     t.datetime 'created_at', null: false
#     t.datetime 'updated_at', null: false
#   end

#   create_table 'posts', force: :cascade do |t|
#     t.integer 'AuthorId'
#     t.text 'Title'
#     t.text 'Text'
#     t.integer 'CommentsCounter'
#     t.integer 'LikesCounter'
#     t.datetime 'created_at', null: false
#     t.datetime 'updated_at', null: false
#   end

#   create_table 'users', force: :cascade do |t|
#     t.string 'Name'
#     t.string 'Photo'
#     t.text 'Bio'
#     t.integer 'PostCounter'
#     t.datetime 'created_at', null: false
#     t.datetime 'updated_at', null: false
#   end
# end
