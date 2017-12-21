require 'rails_helper'


RSpec.describe Baker::DashboardsController, type: :controller do

  describe '#order_ready' do
    let(:user) { create(:user, roles: { baker: true }) }

    before(:each) do
      sign_in user
    end

    it 'updates order to pickup' do
      @order = FactoryBot.create(:order, status: 'processing')
      put :order_ready, { order_id: @order.id }
      @order.reload
      expect(@order.status).to eq('pick_up')
      expect(@order.current_order).to eq(false)
      expect(@order.finish_time)
      expect(subject).to redirect_to baker_dashboards_path
    end
  end

  describe '#start_order' do
    let(:user) { create(:user, roles: { baker: true }) }

    before(:each) do
      sign_in user
    end

    it 'updates order to current_order' do
      @order = FactoryBot.create(:order, status: 'pending')
      put :start_order, { order_id: @order.id }
      @order.reload
      expect(@order.status).to eq ('processing')
      expect(@order.start_time)
      expect(@order.current_order).to eq(true)
      expect(subject).to redirect_to baker_dashboards_path
    end
  end
end