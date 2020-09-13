class DeleteInnToShops < ActiveRecord::Migration[6.0]
  def change
    remove_column  :shops, :inn
  end
end
