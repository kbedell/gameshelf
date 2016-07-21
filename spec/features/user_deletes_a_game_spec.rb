require 'rails_helper'

feature 'User Adds a Game' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:game) { FactoryGirl.create(:game) }
  let!(:usergame) { FactoryGirl.create(:usersgame, user_id: user.id, game_id: game.id) }

  before :each do
    login_as(user, scope: :user)
    visit usersgames_path
  end

  scenario 'user deletes a game from their list' do
    expect(page).to have_content(game.name)

    click_link 'delete-button'

    expect(page).to_not have_content(game.name)
  end
end
