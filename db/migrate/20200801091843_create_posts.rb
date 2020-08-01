class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :product_id
      t.text :body
      t.integer :mark

      t.timestamps
    end
  end
end
