class AddTopCatToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :top_cat, :string, :default => '[]'
  end
end
