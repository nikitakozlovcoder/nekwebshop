class CreateOrderedProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :ordered_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.text :data
      t.string :title
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
