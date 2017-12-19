require 'rails_helper'

RSpec.describe 'dashboards index', type: :feature do
  let(:user) { create(:user) }
  let(:pending_order) { create(:order, status: 'pending') }
  let(:processing_order) { create(:order, status: 'processing') }
  let(:order_for_pick_up) { create(:order, status: 'pick_up') }
  
  before(:each) do
    login_as(user, scope: :user)
  end

  it 'shows pending orders' do
    visit '/cashier/dashboards'
    expect(page).to have_css('.pending-orders')
  end

  it 'shows orders in process' do
  	visit '/cashier/dashboards'
    expect(page).to have_css('.processing-orders')
  end

  it 'shows completed orders ready for pickup' do
    visit '/cashier/dashboards'
    expect(page).to have_css('.pick-up-orders')
  end
end