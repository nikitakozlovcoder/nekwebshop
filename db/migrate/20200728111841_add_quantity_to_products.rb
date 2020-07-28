class AddQuantityToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :quantity, :integer
    add_column :products, :is_inf_quantity, :boolean
  end
end
