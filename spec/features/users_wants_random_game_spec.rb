require 'rails_helper'

feature 'Random Game' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user, email: 'jamie@kingslayer.com') }
  let!(:game) { FactoryGirl.create(:game, min_players: 4) }
  let!(:game2) { FactoryGirl.create(:game) }
  let!(:game3) { FactoryGirl.create(:game, max_players: 2) }
  let!(:usersgame) { FactoryGirl.create(:usersgame, user_id: user.id, game_id: game.id) }
  let!(:usersgame2) { FactoryGirl.create(:usersgame, user_id: user2.id, game_id: game2.id) }

  before :each do
    login_as(user, scope: :user)
    visit usersgames_path
  end

  scenario 'user successfully retrieves a random game from their list', js:true do
    visit usersgames_random_path
    fill_in 'players', with: '4'
    click_button 'Choose a Game for Me'

    expect(page).to have_content(game.name)
    expect(page).to have_content(game.min_players)
    expect(page).to have_content(game.max_players)
  end

  scenario 'user submits the form with empty player field', js:true do
    visit usersgames_random_path
    click_button 'Choose a Game for Me'

    expect(page).to have_content(game.name)
    expect(page).to have_content(game.min_players)
    expect(page).to have_content(game.max_players)
  end

  scenario 'user submits the form with an invalid characters', js:true do
    visit usersgames_random_path
    click_button 'Choose a Game for Me'

    expect(page).to have_content('Please enter a valid number or leave the field blank')
  end

  scenario 'user should not see games not on their list', js:true do
    visit usersgames_random_path
    fill_in 'players', with: '4'
    click_button 'Choose a Game for Me'

    expect(page).to_not have_content(game2.name)
  end

  scenario 'user should not see games that do not meet their player criteria', js:true do
    visit usersgames_random_path
    fill_in 'players', with: '4'
    click_button 'Choose a Game for Me'

    expect(page).to_not have_content(game3.name)
  end
end
