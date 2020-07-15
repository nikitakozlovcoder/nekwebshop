class CreateCategoriesMakersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_makers do |t|
      t.belongs_to :category
      t.belongs_to :maker
    end
  end
end
