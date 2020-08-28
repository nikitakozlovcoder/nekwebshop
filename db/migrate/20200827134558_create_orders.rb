class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :name
      t.string :surname
      t.string :phone
      t.string :email
      t.integer :address_id
      t.integer :shop_id

      t.timestamps
    end
  end
end
