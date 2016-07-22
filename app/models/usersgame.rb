class Usersgame < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  validates :game_id, presence: true
  validates :user_id, presence: true
  validates :game_id, uniqueness: { scope: :user_id, message: 'has already been taken' }

  def self.filtered_games(players, games)
    filtered_games = []

    games.each do |game|
      if players.to_i <= game.max_players && players.to_i >= game.min_players
        filtered_games << game
      end
    end

    filtered_games
  end

  def self.random_game(games)
    games.sample
  end
end
