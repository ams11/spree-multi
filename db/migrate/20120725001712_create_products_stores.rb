class CreateProductsStores < ActiveRecord::Migration
  def up
    remove_column :products, :store_id

    create_table :products_stores, :id => false do |t|
      t.references :product
      t.references :store
      t.timestamps
    end
  end

  def down
    add_column :products, :store_id, :integer

    drop_table :products_stores
  end
end
