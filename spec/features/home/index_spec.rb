require 'rails_helper'


RSpec.describe 'Home Index', type: :feature do
  
  let(:manager_user) { create(:user, manager: true) }
  let(:non_manager_user) { create(:user)}

  it 'has options for manager if user is manager' do
    login_as(manager_user, scope: :user)
    visit '/'
    expect(page).to have_content 'Manager'
    expect(page).to have_content 'Cook'
    expect(page).to have_content 'Cashier'
  end
  it 'does not have options for manager is user is not manager' do
    login_as(non_manager_user, scope: :user)
    visit '/'
    expect(page).to_not have_content 'Manager'
    expect(page).to have_content 'Cook'
    expect(page).to have_content 'Cashier'
  end
end