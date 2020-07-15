class AddColsToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :name, :string
    add_column :categories, :data, :string
  end
end
