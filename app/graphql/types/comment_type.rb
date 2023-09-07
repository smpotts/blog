class Types::CommentType < Types::BaseObject
  description "A comment on the post"

  field :id, ID, null: false
  field :post_id, Integer, null: true
  field :body, String, null: true

end
