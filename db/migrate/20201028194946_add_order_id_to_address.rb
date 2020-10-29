class AddOrderIdToAddress < ActiveRecord::Migration[6.0]

  def change
    #create_table :addresses do |t|
      #t.string :city
     # t.string :street
     # t.string :state
     # t.string :country
     # t.string :zip
     # t.string :suburb
      #t.string :county
     # t.integer :shop_id

     # t.timestamps
   # end
    add_column :addresses, :order_id, :integer
  end
end
