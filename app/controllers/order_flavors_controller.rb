class OrderFlavorsController < ApplicationController
  # GET /order_flavors
  # GET /order_flavors.json
  def index
    @order_flavors = OrderFlavor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @order_flavors }
    end
  end

  # GET /order_flavors/1
  # GET /order_flavors/1.json
  def show
    @order_flavor = OrderFlavor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @order_flavor }
    end
  end

  # GET /order_flavors/new
  # GET /order_flavors/new.json
  def new
    @order_flavor = OrderFlavor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @order_flavor }
    end
  end

  # GET /order_flavors/1/edit
  def edit
    @order_flavor = OrderFlavor.find(params[:id])
  end

  # POST /order_flavors
  # POST /order_flavors.json
  def create
    @order_flavor = OrderFlavor.new(params[:order_flavor])

    respond_to do |format|
      if @order_flavor.save
        format.html { redirect_to @order_flavor, :notice => 'Order flavor was successfully created.' }
        format.json { render :json => @order_flavor, :status => :created, :location => @order_flavor }
      else
        format.html { render :action => "new" }
        format.json { render :json => @order_flavor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /order_flavors/1
  # PUT /order_flavors/1.json
  def update
    @order_flavor = OrderFlavor.find(params[:id])

    respond_to do |format|
      if @order_flavor.update_attributes(params[:order_flavor])
        format.html { redirect_to @order_flavor, :notice => 'Order flavor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @order_flavor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /order_flavors/1
  # DELETE /order_flavors/1.json
  def destroy
    @order_flavor = OrderFlavor.find(params[:id])
    @order_flavor.destroy

    respond_to do |format|
      format.html { redirect_to order_flavors_url }
      format.json { head :ok }
    end
  end
end
