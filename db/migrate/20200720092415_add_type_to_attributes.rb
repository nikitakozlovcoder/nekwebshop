class AddTypeToAttributes < ActiveRecord::Migration[6.0]
  def change
    add_column :attributes, :type, :string
  end
end
