class AddPhoneToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :phone, :string
  end
end
