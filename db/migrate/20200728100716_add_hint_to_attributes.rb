class AddHintToAttributes < ActiveRecord::Migration[6.0]
  def change
    add_column :attributes, :hint, :string
  end
end
