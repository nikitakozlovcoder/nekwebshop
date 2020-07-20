class CreateAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :attributes do |t|
      t.string :name
      t.string :text
      t.decimal :num
      t.integer :product_id
      t.timestamps
    end
  end
end
