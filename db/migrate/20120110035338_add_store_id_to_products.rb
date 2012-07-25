class AddStoreIdToProducts < ActiveRecord::Migration
  def up
    add_column :products, :store_id, :integer
  end

  def down
    remove_column :products, :store_id
  end
end
