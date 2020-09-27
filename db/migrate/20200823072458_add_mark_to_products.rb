class AddMarkToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :mark, :float
  end
end
