require "rails_helper"

feature "User Signs Out" do
  scenario "User sucessfuly signs out" do
    user = FactoryGirl.create(:user)
    visit festivals_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "user_password", with: user.password
    click_button "sign_in_button"

    expect(page).to have_content("Sign Out")

    click_link "Sign Out"

    expect(page).to have_content("Sign In")
    expect(page).to have_content("Signed out successfully.")
  end

  scenario "User can not sign out unless already signed in" do
    visit festivals_path

    expect(page).to_not have_content("Sign Out")
  end
end
