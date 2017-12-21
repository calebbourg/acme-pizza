class AddCashierIdToOrders < ActiveRecord::Migration
  def up
  	add_column :orders, :cashier_id, :integer, foreign_key: true
  end

  def down
    remove_column :orders, :cashier_id
  end
end
