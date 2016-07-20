require 'rubygems'
require 'nokogiri'
require 'open-uri'

class BoardGameGeek

  def self.search_games(game_name)
    response =  Nokogiri::HTML(open('https://www.boardgamegeek.com/xmlapi/search?search=' + game_name))
    return response
  end

  def self.add_game(game_id)
    page = Nokogiri::HTML(open('https://www.boardgamegeek.com/xmlapi/boardgame/' + game_id))
    return page
  end

  private

  def get_search_data
    @search_data ||= search_games("tokaido")
  end
end
