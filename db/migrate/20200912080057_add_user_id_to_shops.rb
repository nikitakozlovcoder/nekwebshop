class AddUserIdToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :user_id, :integer
  end
end
