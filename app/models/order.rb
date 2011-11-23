class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_products
  belongs_to :status
  
   def self.exist_order(user,status)
    where("user_id = '#{user}' AND status_id = '#{status}'").first
  end
  
  def self.total_order
    
  end
end
