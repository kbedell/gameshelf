require "rails_helper"

feature "User Signs Up" do
  let!(:user) { FactoryGirl.build(:user) }
  let!(:user2) { FactoryGirl.build(:user) }

  scenario "User enters valid information" do
    visit usersgames_path
    click_link "Sign Up"
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: user.password
    click_button "Sign Up"

    expect(page).to have_content("Welcome to Gameshelf")
    expect(page).to have_content("Sign Out")
  end

  scenario "User does not enter all reqiured information" do
    visit usersgames_path
    click_link "Sign Up"
    click_button "Sign Up"

    expect(page).to have_content("First cannot be blank")
    expect(page).to have_content("Last cannot be blank")
    expect(page).to have_content("Email cannot be blank")
    expect(page).to have_content("Password cannot be blank")
    expect(page).to have_content("Password confirmation cannot be blank")
  end

  scenario "User's passwords do not match" do
    visit usersgames_path
    click_link "Sign Up"
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: "masterOfCoin"
    click_button "Sign Up"

    expect(page).to have_content("Password do not match match")
  end

  scenario "User already has an account or email is in use" do
    visit usersgames_path
    click_link "Sign Up"
    fill_in "Username", with: user2.username
    fill_in "First Name", with: user2.first_name
    fill_in "Last Name", with: user2.last_name
    fill_in "Email", with: user2.email
    fill_in "user_password", with: user2.password
    fill_in "user_password_confirmation", with: user2.password_confirmation
    click_button "Sign Up"

    expect(page).to have_content("has already been taken")
  end
end
