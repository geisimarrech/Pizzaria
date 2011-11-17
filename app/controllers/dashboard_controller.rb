class DashboardController < ApplicationController
  layout "application"
  
  before_filter :logado
  before_filter :load_variables
  
  def index
    @orders = Order.new
    @product = Product.new 
    if @order
      @itens = OrderProduct.where(:order_id => @order.id)
    end 
  end
  
  
  private
  def load_variables
    @groups = Group.all
    @sizes = Size.all
    @order = Order.find(:first, :conditions => { :status_id => 1, :user_id => current_user.id })
    @flavors = Flavor.all
  end
  
  def logado
    unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
  end
end
