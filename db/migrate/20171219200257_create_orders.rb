class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.string :customer_phone, null: false
    	t.string :customer_name, null: false
    	t.datetime :pick_up, null: false
    	t.string :pizza_type, null: false
    	t.string :pizza_size, null: false
    	t.references :user, index: true
    end
  end
end
