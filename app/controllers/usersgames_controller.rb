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
end
