class AddCompletedTimeToOrder < ActiveRecord::Migration
  def up
  	add_column :orders, :completed_time, :datetime
  end

  def down
    remove_column :orders, :completed_time
  end 
end
