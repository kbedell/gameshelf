require 'rails_helper'

describe '#search_games', vcr: { cassette_name: 'game_search' } do
  it 'returns Nokogiri XML Document' do
    game_data = BoardGameGeek.search_games('tokaido')

    expect(game_data.class).to eq Nokogiri::XML::Document

    expect(game_data.css('boardgame').class).to eq Nokogiri::XML::NodeSet
    expect(game_data.css('boardgame').length).to eq 8
  end
end

describe '#add_game', vcr: { cassette_name: 'game_add' } do
  it 'returns Nokogiri XML Document' do
    game_data = BoardGameGeek.add_game('123540')

    expect(game_data.class).to eq Nokogiri::XML::Document

    expect(game_data.css("name[primary='true']").text).to eq 'Tokaido'
  end
end
