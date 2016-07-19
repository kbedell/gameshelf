require 'json'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Api::V1::Boardgamegeek::SearchController < ApiController
  include HTTParty
  before_action :authenticate_user!

  def create
    games = BGGGame.search_games(params['games']['name'])

    render json: {games: games}, status: :ok
  end
end
