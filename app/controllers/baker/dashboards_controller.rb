module Baker
  class DashboardsController < ApplicationController
    
    def index
      @role = 'baker'
      @pending_orders = Order.today_orders.pending.order(pick_up: :asc).limit(3)
      @current_order = Order.is_current_order.first
      @orders_ready_for_pick_up = Order.today_orders.ready_for_pick_up.order(pick_up: :asc).limit(3)
      @completed_orders = Order.completed
    end

    def order_ready
      @order = Order.find(params[:order_id])
      @order.status = 'pick_up'
      @order.current_order = false
      @order.finish_time = DateTime.now
      # we want to know if there are errors
      if @order.save!
        redirect_to baker_dashboards_path, notice: 'You finished an Order!'
      else
      	redirect_to baker_dashboards_path, error: 'Something went wrong.'
      end
    end

    def start_order
      @order = Order.find(params[:order_id])
      @order.baker_id = current_user.id
      @order.status = "processing"
      @order.current_order = true
      @order.start_time = DateTime.now
       # we want to know if there are errors
      if @order.save!
      	redirect_to baker_dashboards_path, notice: 'You Started an Order!'
      else
      	redirect_to baker_dashboards_path, warn: 'Something went wrong.'
      end
    end
  end
end