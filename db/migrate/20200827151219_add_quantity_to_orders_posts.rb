class AddQuantityToOrdersPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :orders_products, :quantity, :integer
  end
end
