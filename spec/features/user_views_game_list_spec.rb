require 'rails_helper'

feature 'User Views Games' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:game) { FactoryGirl.create(:game) }
  let!(:game2) { FactoryGirl.create(:game) }
  let!(:usergame) { FactoryGirl.create(:usersgame, user_id: user.id, game_id: game.id) }
  let!(:usergame2) { FactoryGirl.create(:usersgame, user_id: user.id, game_id: game2.id) }

  before :each do
    login_as(user, scope: :user)
    visit usersgames_path
  end

  scenario 'user sees a list of all games in their list', js:true do
    visit usersgames_path
    wait_for_ajax
    expect(page).to have_content(game.name)
    expect(page).to have_content(game.year)
    expect(page).to have_content(game2.name)
    expect(page).to have_content(game2.year)
  end
end
