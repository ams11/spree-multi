class StoreManager < ActiveRecord::Base
  belongs_to :store
  belongs_to :user
  has_one :role
end