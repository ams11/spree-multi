class Store < ActiveRecord::Base
  has_and_belongs_to_many :products
  has_many :store_managers
  has_many :users, :through => :store_managers
end