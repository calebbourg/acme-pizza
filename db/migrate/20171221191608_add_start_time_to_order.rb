class AddStartTimeToOrder < ActiveRecord::Migration
  def up
  	add_column :orders, :start_time, :datetime 
  end

  def down
    remove_column :orders, :start_time
  end
end
