class ConfShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :mail, :string
    add_column :shops, :inn, :string
    add_column :shops, :description, :text
  end
end
