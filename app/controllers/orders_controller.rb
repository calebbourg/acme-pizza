class OrdersController < ApplicationController
  skip_before_action :check_roles  
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.cashier_id = current_user.id
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