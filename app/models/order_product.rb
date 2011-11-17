class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :size
  has_many :order_flavors, :foreign_key => "order_product_id"
  
  
  def self.add_products(order, product, size=0)
    current_item = OrderProduct.find(:first, :conditions => { :order_id => order.id, :product_id => product })    
    
    if current_item && product != "2"
      qnt = current_item.amount + 1
      current_item.update_attributes(:amount => qnt)
    else
      @order_product = self.new(:order_id => order.id, :product_id => product, :amount => 1, :size_id => size)
      @order_product.save
    end
    
  end
  
  def self.total(itens)
    @total = 0
    itens.each do |v|
      if v.product_id == 2
        @total = (@total + v.size.value) * v.amount
      else
        @total = (@total + v.product.price) * v.amount
      end      
    end
    return @total
  end
  
end
