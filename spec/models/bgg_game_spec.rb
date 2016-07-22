require 'rails_helper'

describe '#create_games_list', vcr: { cassette_name: 'game_search' } do
  it 'returns an array of games' do
    game_data = BoardGameGeek.search_games('tokaido')
    games = BGGGame.create_games_list(game_data)

    expect(games.class).to eq Array
    expect(games.length).to eq 8
    expect(games[0][:name]).to eq 'Tokaido'
  end
end

describe '#create_game', vcr: { cassette_name: 'game_add' } do

  let!(:user) { FactoryGirl.create(:user) }

  it 'game is nil' do
    game_data = BoardGameGeek.add_game('123540')

    expect(Game.all.count).to eq 0
    expect(Usersgame.all.count).to eq 0

    response = BGGGame.create_game('123540', game_data, user.id)

    expect(response.class).to eq Hash

    expect(response[:game][:name]).to eq 'Tokaido'
    expect(response[:game][:year]).to eq '2012'
    expect(response[:game][:id]).to eq 1
    expect(Game.all.count).to eq 1
    expect(Usersgame.all.count).to eq 1
  end

  it 'game is not nil' do
    game = FactoryGirl.create(:game, bggid: 123540)

    expect(Game.all.count).to eq 1
    expect(Usersgame.all.count).to eq 0

    game_data = BoardGameGeek.add_game('123540')
    response = BGGGame.create_game('123540', game_data, user.id)

    expect(response[:game][:name]).to eq 'game of thrones19'
    expect(response[:game][:year]).to eq 2012
    expect(response[:game][:id]).to eq 2
    expect(Game.all.count).to eq 1
    expect(Usersgame.all.count).to eq 1
  end
end
