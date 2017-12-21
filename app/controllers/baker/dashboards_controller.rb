module Baker
  class DashboardsController < ApplicationController
    
    def index
      @role = 'baker'
      @pending_orders = Order.pending.order(pick_up: :desc).limit(3)
      @current_order = Order.is_current_order
      @orders_ready_for_pick_up = Order.ready_for_pick_up.order(pick_up: :desc).limit(3)
      @completed_orders = Order.completed
    end

    def order_ready
      @order = Order.find(params[:order_id])
      @order.baker_id = current_user.id
      @order.status = 'pick_up'
      # we want to know if there are errors
      if @order.save!
        redirect_to baker_dashboards_path, notice: 'You finished an Order!'
      else
      	redirect_to baker_dashboards_path, warn: 'Something went wrong.'
      end
    end
  end
end