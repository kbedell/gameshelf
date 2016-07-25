require 'json'

class Usersgame < ActiveRecord::Base
  include HTTParty

  belongs_to :game
  belongs_to :user

  validates :game_id, presence: true
  validates :user_id, presence: true
  validates :game_id, uniqueness: { scope: :user_id, message: 'has already been taken' }

  def self.filtered_games(players, games)
    if players == ''
      return games
    else
      filtered_games = []

      games.each do |game|
        if players.to_i <= game.max_players && players.to_i >= game.min_players
          filtered_games << game
        end
      end

      return filtered_games
    end
  end

  def self.random_game(games)
    games.sample
  end

  def self.verify_user(authToken)
    url = 'https://api.amazon.com/auth/o2/tokeninfo?access_token=' + authToken

    response = HTTParty.get(url)

    decode = JSON.parse(response.body)

    if decode['aud'] != ENV['AMAZON_CLIENT_ID']
      # the access token does not belong to us
      return false
    else
      url = 'https://api.amazon.com/user/profile'
      options = { headers: {"Authorization" => "Bearer #{authToken}" }}

      response = HTTParty.get(url, options)

      decode = JSON.parse(response.body)

      return decode["user_id"]
    end
  end
end
