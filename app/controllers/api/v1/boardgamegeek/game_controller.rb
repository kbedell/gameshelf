require 'json'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Api::V1::Boardgamegeek::GameController < ApiController
  before_action :authenticate_user!

  def create
    games = BGGGame.add_game(params['game']['name'], current_user.id)

    render json: games
  end
end
