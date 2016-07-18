require "rails_helper"

feature "User Signs Up" do
  let!(:user) { FactoryGirl.build(:user) }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario "User enters valid information" do
    visit usersgames_path
    click_link "Sign Up"
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: user.password
    click_button "sign_up"

    expect(page).to have_content("Welcome to Gameshelf!")
    expect(page).to have_content("Sign Out")
  end

  scenario "User does not enter all reqiured information" do
    visit usersgames_path
    click_link "Sign Up"
    click_button "sign_up"

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario "User's passwords do not match" do
    visit usersgames_path
    click_link "Sign Up"
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: "masterOfCoin"
    click_button "sign_up"

    expect(page).to have_content("Password confirmation doesn't match")
  end

  scenario "User already has an account or email is in use" do
    visit usersgames_path
    click_link "Sign Up"
    fill_in "First name", with: user2.first_name
    fill_in "Last name", with: user2.last_name
    fill_in "Email", with: user2.email
    fill_in "user_password", with: user2.password
    fill_in "user_password_confirmation", with: user2.password_confirmation
    click_button "sign_up"

    expect(page).to have_content("has already been taken")
  end
end
