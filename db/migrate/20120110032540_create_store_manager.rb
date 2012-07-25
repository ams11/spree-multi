class CreateStoreManager < ActiveRecord::Migration
  def up
    create_table :store_managers do |t|
      t.integer :user_id
      t.integer :store_id
      t.integer :role_id
    end
  end

  def down
    drop_table :store_managers
  end
end
