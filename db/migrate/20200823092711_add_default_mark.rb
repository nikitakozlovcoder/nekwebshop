class AddDefaultMark < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :mark, :float, :default => 0
  end
end
