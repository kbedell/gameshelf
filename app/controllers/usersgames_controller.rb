class UsersgamesController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.find_by(id: current_user.id)
    if user
      @games = user.games
    else
      @games = []
    end
  end

  def destroy
    usersgame = Usersgame.find_by(user_id: current_user.id, game_id: params[:id])
    usersgame.destroy
    redirect_to usersgames_path
  end
end
