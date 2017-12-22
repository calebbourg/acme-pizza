require 'rails_helper'

RSpec.describe 'cashier flow', type: :feature do
  let(:user) { create(:user, roles: { cashier: true } ) }
  
  before(:each) do
    login_as(user, scope: :user)
  end

  scenario 'create new order' do
    visit '/cashier/dashboards'
    expect(Order.count).to eq(0)
    click_link 'New Order'
    expect(page).to have_content('New Order')
    fill_in 'customer_phone', with: '5555555555'
    fill_in 'Customer Name', with: 'Caleb'
    fill_in 'pick_up', with: DateTime.now + 1.hour
    click_button 'Save Order'
    expect(page).to have_content('Cashier Dashboard')
    expect(Order.count).to eq(1)
  end

  scenario 'Complete order' do
    @order = FactoryBot.create(:order, status: 'pick_up', cashier_id: user.id, baker_id: user.id)
    visit '/cashier/dashboards'
    click_link('Order Completed')
    expect(page).to_not have_content('Pick Up Time')
  end
end