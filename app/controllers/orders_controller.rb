class OrdersController < ApplicationController
  
  def new

  end

  def create
    @order = Order.create(order_params)
    redirect_to :back
  end


  private

  def order_params
    params.require(:order).permit(:customer_phone, :customer_name, :pick_up, :pizza_type, :pizza_size)
  end
end