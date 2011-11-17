class Group < ActiveRecord::Base
  has_attached_file :icon
  has_many :products
end
