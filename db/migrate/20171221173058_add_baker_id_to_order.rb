class AddBakerIdToOrder < ActiveRecord::Migration
  def up
  	add_column :orders, :baker_id, :integer, foreign_key: true
  end

    def down
    remove_column :orders, :baker_id
  end
end
