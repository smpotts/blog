class Types::UserType < Types::BaseObject
  description "A user of the blog"

  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :street, String, null: true
  field :number, Integer, null: true
  field :city, String, null: true
  field :postcode, Integer, null: true
  field :country, String, null: true

  field :posts, [Types::PostType], null: false

  field :address, String, null: true

  def address
    "#{object.street} #{object.number} #{object.city} #{object.postcode} #{object.country}"
  end
end

class Types::UserInputType < GraphQL::Schema::InputObject
  graphql_name "UserInputType"
  description "All the attributes needed to create/ update a user"

  argument :id, ID, required: false
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :street, String, required: true
  argument :number, Integer, required: true
  argument :city, String, required: true
  argument :postcode, Integer, required: true
  argument :country, String, required: true

  field :errors, [Types::ErrorTypes], null:true

  def errors
    object.errors.map { |e| { field_name: e.attribute, errors: object.errors[e.attribute] } }
  end
end
