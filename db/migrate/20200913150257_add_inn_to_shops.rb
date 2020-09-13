class AddInnToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :inn, :string
  end
end
