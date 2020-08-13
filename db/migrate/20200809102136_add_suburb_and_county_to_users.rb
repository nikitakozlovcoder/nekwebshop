class AddSuburbAndCountyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :suburb, :string
    add_column :users, :county, :string
  end
end
