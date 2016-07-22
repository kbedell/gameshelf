require 'rails_helper'

describe '#search_games', vcr: { cassette_name: 'game_search' } do
  it 'returns Nokogiri XML Document' do
    game_data = BoardGameGeek.search_games('tokaido')
    binding.pry

    expect(game_data.class).to eq Nokogiri::XML::Document
    expect(hipster_data.code).to eq 200

    expect(hipster_data["text"]).to be_a String
    expect(game_data).to include "Listicle VHS meggings placeat occaecat"
  end
end

describe '#add_game', vcr: { cassette_name: 'game_add' } do
  it 'returns Nokogiri XML Document' do
    game_data = BoardGameGeek.search_games('tokaido')

    expect(game_data.class).to eq Nokogiri::XML::Document
  end
end
