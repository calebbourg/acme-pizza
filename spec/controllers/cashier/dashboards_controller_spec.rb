require 'rails_helper'

RSpec.describe Cashier::DashboardsController, type: :controller do 
  

  describe '#complete_order' do
    let(:user) { create(:user, roles: { cashier: true }) }

    before(:each) do
      sign_in user
    end

    it 'updates order to completed' do
      @order = FactoryBot.create(:order, status: 'pick_up')
      put :complete_order, { order_id: @order.id }
      @order.reload
      expect(@order.status).to eq('completed')
      expect(@order.completed_time)
      expect(subject).to redirect_to cashier_dashboards_path
    end
  end
end