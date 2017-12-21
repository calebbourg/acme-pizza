class AddTimeFinishedToOrder < ActiveRecord::Migration
  def up
  	add_column :orders, :time_finished, :datetime
  end


  def down
    remove_column :orders, :time_finished, :datetime
  end
end
