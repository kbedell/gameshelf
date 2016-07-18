class Usersgame < ActiveRecord::Base
  belongs_to :game
  belongs_to :user, dependent: :destroy

  validates :game_id, presence: true
  validates :user_id, presence: true
  validates :game_id, uniqueness: { scope: :user_id, message: "has already been taken" }
end
