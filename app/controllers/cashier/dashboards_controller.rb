module Cashier
  class DashboardsController < ApplicationController
	  before_action :check_roles
    def index
      @role = 'cashier'
      @pending_orders = Order.pending.order(pick_up: :desc).limit(3)
      @current_order = Order.last
      @orders_ready_for_pick_up = Order.ready_for_pick_up.order(pick_up: :desc).limit(3)
    end
  end
end