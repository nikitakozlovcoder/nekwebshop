class Add3nameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :third_name, :string
  end
end
