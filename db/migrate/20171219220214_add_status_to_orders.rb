class AddStatusToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :status, :string, null: false, default: 'pending'
  end
end
