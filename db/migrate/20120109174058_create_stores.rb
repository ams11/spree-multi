class CreateStores < ActiveRecord::Migration
  def up
    create_table :stores do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
    add_index :stores, :name
  end

  def down
    drop_table :stores
  end
end
