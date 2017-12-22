require 'rails_helper'

RSpec.describe 'dashboards index', type: :feature do
  let(:user) { create(:user, roles: { cashier: true } ) }
  
  before(:each) do
    login_as(user, scope: :user)
    @pending_order = FactoryBot.create(:order, status: 'pending', cashier_id: user.id, baker_id: user.id)
    @current_order = FactoryBot.create(:order, status: 'processing', current_order: true, cashier_id: user.id, baker_id: user.id) 
    @finished_order = FactoryBot.create(:order, status: 'pick_up', cashier_id: user.id, baker_id: user.id)
  end

  it 'shows pending orders' do
    visit '/cashier/dashboards'
    expect(page).to have_css('.pending-order')
  end

  it 'shows current order' do
  	visit '/cashier/dashboards'
    expect(page).to have_css('.current-order')
  end

  it 'shows finished orders ready for pickup' do
    visit '/cashier/dashboards'
    expect(page).to have_css('.pick-up-order')
  end

end