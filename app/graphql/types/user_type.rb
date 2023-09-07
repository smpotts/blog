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
