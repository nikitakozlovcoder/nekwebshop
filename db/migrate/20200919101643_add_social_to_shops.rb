class AddSocialToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :vk, :string
    add_column :shops, :fb, :string
    add_column :shops, :tg, :string
    add_column :shops, :wu, :string
  end
end
