class AddCodeRoAttributes < ActiveRecord::Migration[6.0]
  def change
    add_column :attributes, :code, :integer
  end
end
