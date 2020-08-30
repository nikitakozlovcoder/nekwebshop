class AddEmailChangeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email_temp, :string
    add_column :users, :email_temp_code, :string
  end
end
