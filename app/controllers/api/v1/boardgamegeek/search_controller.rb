class Api::V1::Boardgamegeek::SearchController < ApiController
  before_action :authenticate_user!

  def create
    games_xml = BoardGameGeek.search_games(params['games']['name'])
    games = BGGGame.create_games_list(games_xml)

    render json: {games: games}, status: :ok
  end
end
