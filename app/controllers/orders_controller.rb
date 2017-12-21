class OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to cashier_dashboards_path, notice: 'Order Created'
    else
      flash[:alert] = errors_for(@order)
      redirect_to new_order_path
    end
  end


  private

  def order_params
    params.require(:order).permit(:customer_phone, :customer_name, :pick_up, :pizza_type, :pizza_size)
  end
end