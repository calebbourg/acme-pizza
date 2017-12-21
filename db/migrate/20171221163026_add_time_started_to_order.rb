class AddTimeStartedToOrder < ActiveRecord::Migration
  def up
  	add_column :orders, :time_started, :datetime
  end

  def down
    remove_column :orders, :time_started, :datetime
  end
end
