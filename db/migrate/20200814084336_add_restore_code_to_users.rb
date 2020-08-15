class AddRestoreCodeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :resotre_code, :string
  end
end
