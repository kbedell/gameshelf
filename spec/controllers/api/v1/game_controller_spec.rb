require 'rails_helper'

describe Api::V1::Boardgamegeek::GameController do
  describe "POST create" do
    it 'blocks unauthenticated access' do
      sign_in nil

      post :create

      expect(response).to redirect_to(new_user_session_path)
    end

    it 'creates a game ', vcr: { cassette_name: 'game_add' } do
      user = FactoryGirl.create(:user)
      sign_in user

      post :create, {"game"=>{"name"=>"70323"}, "controller"=>"api/v1/boardgamegeek/game", "action"=>"create"}

      expect(response).to be_success
      expect(response.body).to include ('King of Tokyo')
    end
  end
end
