require 'rails_helper'

RSpec.describe 'baker flow', type: :feature do
  let(:user) { create(:user, roles: { baker: true } ) }
  
  before(:each) do
    login_as(user, scope: :user)
  end

  scenario 'start order/finish Order' do
    @order = FactoryBot.create(:order, status: 'pending', cashier_id: user.id, baker_id: user.id)
    visit '/baker/dashboards'
    expect(page).to have_content('Pick Up Time')
    expect(page).to_not have_content('Current Order')
    click_link 'Start Order'
    expect(@order.reload.status).to eq('processing')
    expect(page).to have_content('Current Order')
    click_link 'Order Ready'
    expect(page).to_not have_content('Current Order')
    expect(@order.reload.status).to eq('pick_up')
  end
end