class Rename < ActiveRecord::Migration[6.0]
  def change
    rename_column :attributes, :type, :type_name
  end
end
