class StoreManager < ActiveRecord::Base
  belongs_to :store
  belongs_to :user, :class_name => "Spree::User"
  belongs_to :role, :class_name => "Spree::Role"
end