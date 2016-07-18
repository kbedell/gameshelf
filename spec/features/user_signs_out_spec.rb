require 'rails_helper'

feature 'User Signs Out' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'User sucessfully signs out' do
    visit usersgames_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'log_in'
    expect(page).to have_content('Sign Out')

    click_link 'Sign Out'

    expect(page).to have_content('Sign In')
    expect(page).to have_content('Signed out successfully.')
  end

  scenario 'User cannot sign out unless already signed in' do
    visit usersgames_path

    expect(page).to_not have_content('Sign Out')
  end
end
