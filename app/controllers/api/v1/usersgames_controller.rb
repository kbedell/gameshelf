class Api::V1::UsersgamesController < ApiController
  include HTTParty

  def create
    puts "Params " + params
    puts "Response Header " + response.header

    request_header = params['session']['user']['accessToken']

    url = 'https://api.amazon.com/auth/o2/tokeninfo?access_token=' + request_header

    response = HTTParty.get(url)

    decode = JSON.parse(response.body)

    if decode['aud'] != ENV['AMAZON_CLIENT_ID']
      # the access token does not belong to us
      render json: {game: "Not a valid amazon request"}
    else
      url = 'https://api.amazon.com/user/profile'
      options = { headers: {"Authorization" => "Bearer #{request_header}" }}

      response = HTTParty.get(url, options)

      decode = JSON.parse(response.body)

      if User.find_by(uid: decode["user_id"])
        user = User.find_by(uid: decode["user_id"])
        all_games = user.games

        filtered_games = Usersgame.filtered_games(params['request']['intent']['slots']['players']['value'], all_games)
        if filtered_games != []
          game = Usersgame.random_game(filtered_games)
          render json: {game: game}, status: :ok
        else
          render json: {game: 'No Game'}, status: :ok
        end
      else
        render json: {game: "Not a user in our system"}
      end
    end
  end

  def show
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
