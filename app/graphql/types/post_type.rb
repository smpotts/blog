class Types::PostType < Types::BaseObject
  description "A blog post"

  field :id, ID, null: false
  field :user_id, Integer , null: true
  field :body, String, null: true

  field :comments, [Types::CommentType], null: false
end

