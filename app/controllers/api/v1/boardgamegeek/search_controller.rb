require 'json'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Api::V1::Boardgamegeek::SearchController < ApiController
  include HTTParty
  before_action :authenticate_user!

  def create
    games = []
    page = Nokogiri::HTML(open('https://www.boardgamegeek.com/xmlapi/search?search=' + params['games']['name']))

    boardgames = page.css('boardgame')

    boardgames.each do |game|
      game = {name: game.css('name').text,
              year: game.css('yearpublished').text,
              id: game['objectid']
            }
      games << game
    end

    render json: {games: games}, status: :ok
  end
end
