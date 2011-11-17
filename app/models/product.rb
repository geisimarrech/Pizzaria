class Product < ActiveRecord::Base  
   belongs_to :group
   has_many :order_products
   
   attr_accessor :size_id
end
