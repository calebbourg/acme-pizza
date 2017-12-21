require 'rails_helper'

RSpec.describe Order, type: :model do 
  let(:valid_attributes) { attributes_for(:order) }

  describe 'validations' do
    it 'is valid if pick up time is in the future' do
      order = Order.new(valid_attributes.merge(
      	pick_up: DateTime.now + 1.minute
      	))
      expect(order).to be_valid
    end

    it 'is not valid if pick up time is in the past' do
      order = Order.new(valid_attributes.merge(
      	pick_up: DateTime.now - 1.day
      	))
      expect(order).to_not be_valid
      order.save
      expect(order.errors.full_messages).to include('Pick up Must be in future')
    end

    it 'is valid if current order and no other current orders' do
      order1 = Order.create(valid_attributes)
      order2 = Order.new(valid_attributes.merge(
      	current_order: true
      	))
      expect(order2).to be_valid
    end

    it 'is not valid on update if current order and current order already exists' do
      order1 = Order.create(valid_attributes.merge(
      	current_order: true
      	))
      order2 = Order.create(valid_attributes)
      order2.current_order = true
      expect(order2).to_not be_valid
      order2.save
      expect(order2.errors.full_messages).to include("Current order One at a Time")
    end

    it 'is not valid if current order and current order already exists' do
      order1 = Order.create(valid_attributes.merge(
        current_order: true
        ))
      order2 = Order.new(valid_attributes.merge(
        current_order: true
        ))
      expect(order2).to_not be_valid
      order2.save
      expect(order2.errors.full_messages).to include("Current order has already been taken")
    end
  end

  describe 'today_orders' do
    it 'lists orders with pick up time for today' do
      @today_order1 = FactoryBot.create(:order, pick_up: DateTime.now + 1.minute)
      @today_order2 = FactoryBot.create(:order, pick_up: DateTime.now + 1.hour)
      @tomorrow_order = FactoryBot.create(:order, pick_up: DateTime.now + 1.day)
      expect(Order.today_orders).to include(@today_order1)
      expect(Order.today_orders).to include(@today_order2)
      expect(Order.today_orders).to_not include(@tomorrow_order)
    end
  end
end