require "rails_helper"

feature "User Signs In" do
  scenario "User provides valid information" do
    user = FactoryGirl.create(:user)
    visit festivals_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Sign In"
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
    expect(page).to have_content("You have signed in!")
  end

  scenario "user submits blank sign in form" do
    visit festivals_path
    click_link "Sign In"
    click_button "Sign In"

    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Either your Email or password are incorrect. Or you forgot to fill in a field.")

  end

  scenario "user name and password don't match" do
    user = FactoryGirl.create(:user)
    visit festivals_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "user_password", with: "any password"
    click_button "Sign In"

    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Either your Email or password are incorrect. Or you forgot to fill in a field.")

  end

  scenario "user has not registered" do
    visit festivals_path
    click_link "Sign In"
    fill_in "Email", with: "randomuser@mail.com"
    fill_in "user_password", with: "randompassword"
    click_button "Sign In"

    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("That Email does not exist yet. Please sign up.")

  end
end
