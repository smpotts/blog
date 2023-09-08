module Types
  class MutationType < Types::BaseObject
    field :create_user, Types::UserType, mutation: Mutations::CreateUser

    field :update_user, Boolean, null: false, description: "Updates a user" do
      argument :user, Types::UserInputType, required: true
    end

    def update_user(user:)
      existing = User.where(id: user[:id]).first
      existing&.update(user.to_h)
    end

    field :delete_user, Boolean, null: false, description: "Deletes a user" do
      argument :id, ID, required: true
    end

    def delete_user(id:)
      User.where(id: id).destroy_all
      true
    end
  end
end
