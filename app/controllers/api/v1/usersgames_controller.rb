require 'json'

class Api::V1::UsersgamesController < ApiController
  def show
    request_header = request.headers["accessToken"]

    if request_header
      user_id = Usersgame.verify_user(request_header)
      user = User.find_by(uid: user_id)

      if user
        all_games = user.games

        filtered_games = Usersgame.filtered_games(request.headers["players"], all_games)
        if filtered_games != []
          game = Usersgame.random_game(filtered_games)
          render json: {game: game}, status: :ok
        else
          render json: {game: 'No Game'}, status: :ok
        end
      else
        render json: {game: "Not a user in our system"}
      end
    else
      user = current_user
      all_games = user.games

      filtered_games = Usersgame.filtered_games(params['players']['players'], all_games)
      if filtered_games != []
        game = Usersgame.random_game(filtered_games)
        render json: {game: game}, status: :ok
      else
        render json: {game: 'No Game'}, status: :ok
      end
    end
  end

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
