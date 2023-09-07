module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :user, Types::UserType, null: true, description: "Returns one user instance" do
      argument :id, ID, required: true
    end

    def user(id:)
      User.where(id: id).first
    end

    field :post, Types::PostType, null: true, description: "Returns one post instance" do
      argument :id, ID, required: true
    end

    def post(id:)
      Post.where(id: id).first
    end

    field :user_posts, Types::PostType, null: true, description: "Returns posts by a given user" do
      argument :user_id, Integer, required: true
    end

    def user_posts(user_id:)
      Post.where(user_id: user_id).first
    end

    field :post_comments, Types::CommentType, null: true, description: "Returns all the comments on a post" do
      argument :post_id, Integer, required: true
    end

    def post_comments(post_id:)
      Comment.where(post_id: post_id).first
    end

  end
end
