require 'json'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

class BGGGame
  include HTTParty

  def self.search_games(game_name)
    games = []
    page = Nokogiri::HTML(open('https://www.boardgamegeek.com/xmlapi/search?search=' + game_name))

    boardgames = page.css('boardgame')

    boardgames.each do |game|
      game = {name: game.css('name').text,
              year: game.css('yearpublished').text,
              id: game['objectid']
            }
      games << game
    end

    return games
  end

  def self.add_game(game_id, user_id)
    page = Nokogiri::HTML(open('https://www.boardgamegeek.com/xmlapi/boardgame/' + game_id))

    game = Game.find_by(bggid: game_id)

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
      boardgame.bggid = game_id
      boardgame.save!

      usersgame = Usersgame.new()
      usersgame.user_id = user_id
      usersgame.game_id = game.id
      usersgame.save

      return {game: {name: boardgame.name = page.css('name')[0].text, year: boardgame.year = page.css('yearpublished').text}}
    else
      usersgame = Usersgame.new()
      usersgame.user_id = user_id
      usersgame.game_id = game.id
      usersgame.save

      return {game: {name: game.name, year: game.year}}
    end
  end
end
