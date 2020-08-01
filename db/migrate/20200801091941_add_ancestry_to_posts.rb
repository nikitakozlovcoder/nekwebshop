class AddAncestryToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :ancestry, :string
    add_index :posts, :ancestry
  end
end
