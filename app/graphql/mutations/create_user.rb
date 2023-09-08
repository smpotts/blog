class Mutations::CreateUser < GraphQL::Schema::Mutation
  # nullability
  null true

  argument :user, Types::UserInputType, required: true

  def resolve(user:)
    User.create(user.to_h)
  end
end
