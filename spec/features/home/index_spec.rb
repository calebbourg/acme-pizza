require 'rails_helper'


RSpec.describe 'home index' do
  let(:baker) { create(:user, roles: { baker: true } ) }
  let(:cashier) { create(:user, roles: { cashier: true } ) }
  let(:cashier_baker) { create(:user, roles: { cashier: true, baker: true } ) }
  let(:manager) { create(:user, manager: true ) }


  scenario 'Baker can only use baker dashboard' do
    login_as(baker, scope: :user)
    visit '/'
    click_link 'Baker'
    expect(page).to have_content('Dashboard')
    visit '/'
    click_link 'Cashier'
    expect(page).to_not have_content('Dashboard')
    visit '/'
    click_link 'Manager'
    expect(page).to_not have_content('Dashboard')
  end

  scenario 'cashier can only use cashier dashboard' do
    login_as(cashier, scope: :user)
    visit '/'
    click_link 'Baker'
    expect(page).to_not have_content('Dashboard')
    visit '/'
    click_link 'Cashier'
    expect(page).to have_content('Dashboard')
    visit '/'
    click_link 'Manager'
    expect(page).to_not have_content('Dashboard')
  end

  scenario 'Baker can only use baker dashboard' do
    login_as(baker, scope: :user)
    visit '/'
    click_link 'Baker'
    expect(page).to have_content('Dashboard')
    visit '/'
    click_link 'Cashier'
    expect(page).to_not have_content('Dashboard')
    visit '/'
    click_link 'Manager'
    expect(page).to_not have_content('Dashboard')
  end

  scenario 'manager can visit all dashboards' do
    login_as(manager, scope: :user)
    visit '/'
    click_link 'Baker'
    expect(page).to have_content('Dashboard')
    visit '/'
    click_link 'Cashier'
    expect(page).to have_content('Dashboard')
    visit '/'
    click_link 'Manager'
    expect(page).to have_content('Dashboard')
  end

  scenario 'users can have multiple roles' do
    login_as(cashier_baker, scope: :user)
    visit '/'
    click_link 'Baker'
    expect(page).to have_content('Dashboard')
    visit '/'
    click_link 'Cashier'
    expect(page).to have_content('Dashboard')
    visit '/'
    click_link 'Manager'
    expect(page).to_not have_content('Dashboard')
  end
end