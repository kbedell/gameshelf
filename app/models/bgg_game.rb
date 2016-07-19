require 'rubygems'
require 'nokogiri'

class BGGGame
  include HTTParty

  def self.create_games_list(page)
    games = []
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

  def self.create_game(game_id, page, user_id)
    game = Game.find_by(bggid: game_id)
    
    if game == nil
      boardgame = Game.new()
      boardgame.name = page.css("name[primary='true']").text

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
      usersgame.game_id = boardgame.id
      usersgame.save

      return {game: {name: page.css("name[primary='true']").text, year: page.css('yearpublished').text}}
    else
      usersgame = Usersgame.new()
      usersgame.user_id = user_id
      usersgame.game_id = game.id
      usersgame.save

      return {game: {name: game.name, year: game.year}}
    end
  end
end
