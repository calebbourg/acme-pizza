module Manager
  class DashboardsController < ApplicationController
   
    def index
      @order = Order.new
      @pending_orders = Order.pending
      @processing_orders = Order.processing
      @orders_ready_for_pick_up = Order.ready_for_pick_up
      @completed_orders = Order.completed
    end
  end
end