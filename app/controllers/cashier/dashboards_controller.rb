module Cashier
  class DashboardsController < ApplicationController
	  before_action :check_roles
    def index
      @role = 'cashier'
      @pending_orders = Order.pending.order(pick_up: :desc).limit(3)
      @current_order = Order.is_current_order.first
      @orders_ready_for_pick_up = Order.ready_for_pick_up.order(pick_up: :desc).limit(3)
    end

    def complete_order
      @order = Order.find(params[:order_id])
      @order.status = 'completed'
      @order.completed_time = DateTime.now
      # we want to know if there are errors
      if @order.save!
      	redirect_to cashier_dashboards_path, notice: 'Order Completed!'
      else
      	redirect_to cashier_dashboards_pathm, error: 'Something went wrong'
      end
    end
  end
end