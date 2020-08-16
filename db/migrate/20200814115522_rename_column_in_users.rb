class RenameColumnInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :resotre_code, :restore_code
  end
end
