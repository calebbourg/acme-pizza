class AddCurrentOrderToOrder < ActiveRecord::Migration
  def up
  	add_column :orders, :current_order, :boolean, default: false
  end

  def down
    remove_column :orders, :current_order
  end
end
