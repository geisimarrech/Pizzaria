class OrderProductsController < ApplicationController
  
  respond_to :html, :js
  
  def destroy
    @item = OrderProduct.find(params[:id])
    if @item
      @item.destroy
      flash[:notice] = "Item Deletado."
    end
      respond_with @item
  end
  
end
