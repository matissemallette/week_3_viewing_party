require 'rails_helper'

RSpec.describe 'Dashboard Page' do
  it 'can be accessed with /dashboard when logged in' do 
    user = User.create(name: 'User One', email: 'email@example.com', password: 'password123')
    visit root_path
    click_link 'Log In'
    fill_in :email, with: 'email@example.com'
    fill_in :password, with: 'password123'
    click_button 'Log In'
    visit root_path
    expect(current_path).to eq(root_path)
    visit '/dashboard'
    expect(page).to have_content("User One's Dashboard")
  end
  it 'redirects unregistered user to landing' do
    visit '/dashboard'
    expect(current_path).to eq(root_path)
    expect(page).to have_content('You must be logged in or registered to access your dashboard.')
  end
end