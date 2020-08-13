class AddRestoreDateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :restore_date, :datetime
  end
end
