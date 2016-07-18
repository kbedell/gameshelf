class Game < ActiveRecord::Base
  has_many :usersgames
  has_many :users, through: :usersgames

  validates :name, presence: true
  validates :genre, presence: true
  validates :designer, presence: true
  validates :description, presence: true
  validates :max_players, presence: true, numericality: { only_integer: true }
  validates :min_players, presence: true, numericality: { only_integer: true }
  validates :max_playtime, presence: true, numericality: { only_integer: true }
  validates :min_playtime, presence: true, numericality: { only_integer: true }
  validates :year, presence: true, numericality: { only_integer: true }
  validates :name, uniqueness: { scope: :year, message: "has already been taken" }
end
