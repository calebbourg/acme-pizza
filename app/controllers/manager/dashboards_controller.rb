module Manager
  class DashboardsController < ApplicationController
   before_action :check_manager
    def index
      @role = 'manager'
      @pending_orders = Order.pending.order(pick_up: :desc).limit(3)
      @current_order = Order.last
      @orders_ready_for_pick_up = Order.ready_for_pick_up.order(pick_up: :desc).limit(3)
      @completed_orders = Order.completed
    end

    private


    def check_manager
      redirect_to root_path, notice: 'You are not a manager' unless current_user.manager
    end
  end
end