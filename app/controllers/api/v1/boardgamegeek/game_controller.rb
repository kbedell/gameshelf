class Api::V1::Boardgamegeek::GameController < ApiController
  before_action :authenticate_user!

  def create
    puts params['game']['name']
    page = BoardGameGeek.add_game(params['game']['name'])
    game = BGGGame.create_game(params['game']['name'], page, current_user.id)

    render json: game
  end
end
