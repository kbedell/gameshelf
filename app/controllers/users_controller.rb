class UsersController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_session_path
  end
end
