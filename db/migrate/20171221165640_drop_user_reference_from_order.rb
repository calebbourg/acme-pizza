class DropUserReferenceFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :user_id
  end

  def down
    add_column :orders, :user_id, :integer, foreign_key: true
  end
end
