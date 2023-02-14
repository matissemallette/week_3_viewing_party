require 'rails_helper'

RSpec.describe 'User Logout' do
  it 'displays link to log out user if user is logged in' do
    user = User.create(name: 'User One', email: 'email@example.com', password: 'password123')

    visit '/'

    expect(page).to have_content('Log In')

    click_link 'Log In'

    fill_in :email, with: 'email@example.com'
    fill_in :password, with: 'password123'
    click_button 'Log In'

    expect(page).to have_content("#{user.name}'s Dashboard")
    expect(page).to have_content('Log Out')
  end

  it 'returns to landing page upon logout' do
    user = User.create(name: 'User One', email: 'email@example.com', password: 'password123')

    visit '/'

    click_link 'Log In'

    fill_in :email, with: 'email@example.com'
    fill_in :password, with: 'password123'
    click_button 'Log In'

    expect(page).to have_content("#{user.name}'s Dashboard")
    expect(page).to have_content('Log Out')

    click_link 'Log Out'

    expect(current_path).to eq('/')
    expect(page).to have_content('Log In')
  end
end