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
  end
end