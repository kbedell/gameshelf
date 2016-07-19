require 'json'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Api::V1::Boardgamegeek::GameController < ApiController
  include HTTParty
  before_action :authenticate_user!

  def create
    page = Nokogiri::HTML(open('https://www.boardgamegeek.com/xmlapi/boardgame/' + params['game']['name']))
    game = Game.find_by(bggid: params['game']['name'])

    if !game
      boardgame = Game.new()
      boardgame.name = page.css('name')[0].text

      if boardgame.genre = page.css('boardgamesubdomain')[0]
        boardgame.genre = page.css('boardgamesubdomain')[0].text
      end

      if page.css('boardgamedesigner')[0]
        boardgame.designer = page.css('boardgamedesigner')[0].text
      end

      if boardgame.description = page.css('description')
        boardgame.description = page.css('description').text
      end

      boardgame.max_players = page.css('maxplayers').text
      boardgame.min_players = page.css('minplayers').text
      boardgame.max_playtime = page.css('maxplaytime').text
      boardgame.min_playtime = page.css('minplaytime').text
      boardgame.year = page.css('yearpublished').text
      boardgame.bggid = params['game']['name']
      boardgame.save!

      usersgame = Usersgame.new()
      usersgame.user_id = current_user.id
      usersgame.game_id = game.id
      usersgame.save

      render json: {game: {name: page.css('name')[0].text, year: page.css('yearpublished').text}}
    else
      usersgame = Usersgame.new()
      usersgame.user_id = current_user.id
      usersgame.game_id = game.id
      usersgame.save

      render json: {game: {name: game.name, year: game.year}}
    end
  end
end
