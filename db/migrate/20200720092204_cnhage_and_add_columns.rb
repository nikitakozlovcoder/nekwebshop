class CnhageAndAddColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :float
    change_column :attributes, :num, :float
    add_column :attributes, :check, :boolean
  end
end
