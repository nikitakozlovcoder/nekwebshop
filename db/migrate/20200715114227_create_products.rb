class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.string :maker_name
      t.boolean :custom_maker
      t.timestamps
    end
  end
end
