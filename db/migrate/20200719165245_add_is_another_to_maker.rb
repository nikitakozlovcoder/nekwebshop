class AddIsAnotherToMaker < ActiveRecord::Migration[6.0]
  def change
    add_column :makers, :is_another, :boolean
  end
end
