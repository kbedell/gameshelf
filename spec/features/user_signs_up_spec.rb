require "rails_helper"

feature "User Signs Up" do
  scenario "User enters valid information" do
    visit usersgames_path
    click_link "Sign Up"
    fill_in "Username", with: "username"
    fill_in "First Name", with: "Bob"
    fill_in "Last Name", with: "Smith"
    fill_in "Email", with: "user@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign Up"

    expect(page).to have_content("Welcome to Fevstivaluations!")
    expect(page).to have_content("Sign Out")
  end

  scenario "required info not supplied" do
    visit festivals_path
    click_link "Sign Up"
    click_button "Sign Up"

    expect(page).to have_content("can't be blank")
  end

  scenario "password information doesn't match" do
    visit festivals_path
    click_link "Sign Up"
    fill_in "Username", with: "username"
    fill_in "First Name", with: "Bob"
    fill_in "Last Name", with: "Smith"
    fill_in "Email", with: "user@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "passwrd"
    click_button "Sign Up"

    expect(page).to have_content("doesn't match")
  end

  scenario "email already exists" do
    user = FactoryGirl.create(:user, username: "firstUser")
    visit festivals_path
    click_link "Sign Up"
    fill_in "Username", with: user.username
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: user.password_confirmation
    click_button "Sign Up"

    expect(page).to have_content("has already been taken")
  end

  scenario "username already exists" do
    user = FactoryGirl.create(:user)
    visit festivals_path
    click_link "Sign Up"
    fill_in "Username", with: user.username
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Email", with: "someemail@email.com"
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: user.password_confirmation
    click_button "Sign Up"

    expect(page).to have_content("has already been taken")
  end
end
