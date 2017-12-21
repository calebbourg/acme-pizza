module Manager
  class DashboardsController < ApplicationController
   before_action :check_manager
    def index
      @role = 'manager'
      @pending_orders = Order.today_orders.pending.order(pick_up: :asc)
      @current_order = Order.is_current_order.first
      @orders_ready_for_pick_up = Order.today_orders.ready_for_pick_up.order(pick_up: :asc)
      @completed_orders = Order.today_orders.completed
    end

    private


    def check_manager
      redirect_to root_path, notice: 'You are not a manager' unless current_user.manager
    end
  end
end