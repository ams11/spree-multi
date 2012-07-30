class Store < ActiveRecord::Base
  has_and_belongs_to_many :products, :class_name => "Spree::Product", :join_table => 'products_stores'
  has_many :store_managers
  has_many :users, :class_name => "Spree::User", :through => :store_managers
end