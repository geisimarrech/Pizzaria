class OrdersController < ApplicationController
  respond_to :html, :js
  
  def new
 
      @order = Order.new
      @order.user_id = current_user.id
      @order.status_id = 1
      
      size= params[:size].blank? ? 0 : params[:size]
      
      product = params[:id]
      
      @orders = Order.exist_order(current_user.id, 1)
      
      if @orders
        OrderProduct.add_products(@orders,product, size)
        flash[:notice] = "Seu produto foi adicionado em pedido existente"
        redirect_to root_path
      else
          @order.save
          OrderProduct.add_products(@order,product, size)
          flash[:notice] = "Produto adicionado"
          redirect_to root_path
      end

  end
  
  def create
    @order = Order.new(user)
    @order.user_id = user
    if @order.save
      puts "----------------"
    end
  end
  
  def index
    @orders = Order.where(:user_id => current_user.id)
  end
  
  def finalize_or_cancel
    id = params[:id]
    action = params[:type]
    
    @order = Order.first(:conditions => {:id => id})
    if @order.update_attributes(:status_id => action)
      if action == "5"
        flash[:notice] = "Pedido cancelado com sucesso."
      else
        flash[:notice] = "Pedido enviado para produção com sucesso, aguarde a entrega."
      end
      
    end
    respond_with @order
  end
  
  def show
    order = params[:id]
    @order = Order.find_by_id(order)
    @itens = OrderProduct.where(:order_id => @order.id)
  end
  
  def order_products
    if params[:product]
      @order = Order.new
      @order.user_id = current_user.id
      @order.status_id = 1
      product = params[:product][:product_id]
      size = params[:product][:size_id]
      
      @orders = Order.exist_order(current_user.id, 1)
      
      if @orders
        
        OrderProduct.add_products(@orders,product, size)
        
        
        OrderFlavor.add(OrderProduct.last.id, params[:product][:flavor_id])
        flash[:notice] = "Seu produto foi adicionado em pedido existente"
        redirect_to root_path
      else
          @order.save
          OrderProduct.add_products(@order,product)
          flash[:notice] = "Produto adicionado"
          redirect_to root_path
      end
    end
  end
  
end
