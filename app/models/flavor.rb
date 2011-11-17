class Flavor < ActiveRecord::Base
  has_many :order_flavors, :foreign_key => "flavor_id"
end
