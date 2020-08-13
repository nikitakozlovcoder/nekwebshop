class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :quantity
      t.string :uuid

      t.timestamps
    end
  end
end
