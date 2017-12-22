class RemoveTimeFinishedFromOrder < ActiveRecord::Migration
  def change
  	remove_column :orders, :time_finished, :datetime
  end
end
