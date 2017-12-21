class AddFinishTimeToOrder < ActiveRecord::Migration
  def up
  	add_column :orders, :finish_time, :datetime
  end

  def down
    remove_column :orders, :finish_time
  end
end
