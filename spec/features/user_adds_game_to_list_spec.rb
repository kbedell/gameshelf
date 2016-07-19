require 'rails_helper'

feature 'User Adds a Game' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:game) { FactoryGirl.create(:game) }
  let!(:game2) { FactoryGirl.create(:game) }

  before :each do
    visit usersgames_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'log_in'
    click_link 'My Game List'
  end

  scenario 'user sees a list of all games in their list' do
    expect(page).to have_content(game.name)
    expect(page).to have_content(game.year)
    expect(page).to have_content(game2.name)
    expect(page).to have_content(game.year)
  end

  scenario 'user adds a game to their list' do
    fill "new_game", with: "Eclipse"
    click_button 'Add Game'

    expect(page).to have_content('Eclipse')
    expect(page).to have_content('2011')

  end

  scenario 'user submits a blank form' do
    click_button 'Add Game'

    expect(page).to have_content("can't be blank")
  end

  scenario "user tries to enter a game that doesn't exist" do
    fill "new_game", with: "We Didn't Playtest This at All"
    click_button 'Add Game'

    expect(page).to have_content("Sorry! That game doesn't exist")
    expect(page).to_not have_content("We Didn't Playtest This at All")
  end

end
