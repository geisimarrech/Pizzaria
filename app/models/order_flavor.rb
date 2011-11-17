class OrderFlavor < ActiveRecord::Base
  
  belongs_to :flavor
  belongs_to :order_product
  
  
  def self.add(order,sabores)
    sabores.each do |s|
      self.create(:flavor_id => s, :order_product_id => order)
    end
  end
end
