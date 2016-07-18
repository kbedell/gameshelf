require 'rails_helper'

feature 'User Signs In' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'User provides valid information' do
    visit usersgames_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'log_in'

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'user does not fill in sign in form' do
    visit usersgames_path
    click_link 'Sign In'
    click_button 'log_in'

    expect(page).to_not have_content('Sign Out')
    expect(page).to have_content('Invalid Email or password')

  end

  scenario 'Users email, and name don\'t match' do
    visit usersgames_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: 'any password'
    click_button 'log_in'

    expect(page).to_not have_content('Sign Out')
    expect(page).to have_content('Invalid Email or password')

  end

  scenario 'User has not signed up' do
    visit usersgames_path
    click_link 'Sign In'
    fill_in 'Email', with: 'randomuser@mail.com'
    fill_in 'user_password', with: 'randompassword'
    click_button 'log_in'

    expect(page).to_not have_content('Sign Out')
    expect(page).to have_content('Invalid Email or password.')

  end
end
