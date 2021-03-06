require 'rails_helper'
Capybara.javascript_driver = :poltergeist_with_blacklist

feature 'User Deletes a Game' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:game) { FactoryGirl.create(:game) }
  let!(:usergame) { FactoryGirl.create(:usersgame, user_id: user.id, game_id: game.id) }

  before :each do
    login_as(user, scope: :user)
    visit usersgames_path
  end

  scenario 'user deletes a game from their list', js:true do
    wait_for_ajax
    expect(page).to have_content(game.name)

    find('#delete-button').trigger('click')
    wait_for_ajax
    expect(page).to_not have_content(game.name)
  end
end
