module Cashier
  class DashboardsController < ApplicationController
	  
    def index
      @role = 'baker'
      @pending_orders = Order.pending.order(pick_up: :desc).limit(3)
      @current_order = Order.last
      @orders_ready_for_pick_up = Order.ready_for_pick_up.order(pick_up: :desc).limit(3)
      @completed_orders = Order.completed
    end
  end
end