require 'rubygems'
require 'nokogiri'
require 'open-uri'

class BoardGameGeek

  def self.search_games(game_name)
    url_text = Net::HTTP.get(URI.parse('https://www.boardgamegeek.com/xmlapi/search?search=' + game_name))
    response = Nokogiri::XML(url_text)
    puts response
    return response
  end

  def self.add_game(game_id)
    url_text = Net::HTTP.get(URI.parse('https://www.boardgamegeek.com/xmlapi/boardgame/' + game_id))
    page = Nokogiri::XML(url_text)
    return page
  end

  private

  def get_search_data
    @search_data ||= search_games("tokaido")
  end
end
