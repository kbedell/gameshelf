require 'rails_helper'

feature 'User Edits their Account' do
  let(:user)  { FactoryGirl.create(:user) }

  before :each do
    login_as(user, scope: :user)
    visit usersgames_path
    click_link 'Edit Account'
  end

  scenario 'user successfully edits their account info' do
    new_email = 'newemail@mail.com'
    new_password = 'newpassword1'

    fill_in 'Email', with: new_email
    fill_in 'user_password', with: new_password
    fill_in 'user_password_confirmation', with: new_password
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')

  end

  scenario 'user submits without updating email' do
    click_button 'Update'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Your account has been updated successfully.')
  end

  scenario 'user provides incorrect current password' do
    fill_in 'Current password', with: 'totallynotmypassword'
    click_button 'Update'

    expect(page).to have_content('is invalid')
    expect(page).to_not have_content('Your account has been updated successfully.')
  end

end
