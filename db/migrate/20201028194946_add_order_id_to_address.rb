class AddOrderIdToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :order_id, :integer
  end
end
