class CreateWishes < ActiveRecord::Migration[6.0]
  def change
    create_table :wishes do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
