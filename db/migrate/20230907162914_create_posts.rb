class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :body

      t.timestamps
    end

    # add_foreign_key :users, :posts, column: :user_id
  end
end
