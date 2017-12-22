class RemoveTimeStartedFromOrder < ActiveRecord::Migration
  def change
  	remove_column :orders, :time_started, :datetime
  end
end
