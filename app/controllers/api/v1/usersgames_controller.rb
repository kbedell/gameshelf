class Api::V1::UsersgamesController < ApiController
  def show
    user = current_user.id
    games = user.games
    game = games.sample

    render json: {game: game}, status: :ok
  end

  before_action :authenticate_user!
  def index
    games = User.find(current_user.id).games.order(name: :asc)

    render json: {games: games}, status: :ok
  end

  def destroy
    usersgame = Usersgame.find_by(user_id: current_user.id, game_id: params[:id])
    usersgame.destroy

    render json: {games: 'Game Deleted'}, status: :ok
  end
end
