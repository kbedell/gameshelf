require 'rails_helper'

describe Api::V1::Boardgamegeek::SearchController do
  describe "POST create" do
    it "blocks unauthenticated access" do
      sign_in nil

      post :create

      expect(response).to redirect_to(new_user_session_path)
    end

    it 'returns a list of games', vcr: { cassette_name: 'game_search' } do
      user = FactoryGirl.create(:user)
      sign_in user

      post :create, "games"=>{"name"=>"King of Tokyo"},
         "controller"=>"api/v1/boardgamegeek/search",
         "action"=>"create",
         "search"=>{"games"=>{"name"=>"King of Tokyo"}}

      expect(response).to be_success
      expect(response.body).to include ('King of Tokyo')
      expect(response.body).to include ('King of Tokyo Promo Cards')
      expect(response.body).to include ('King of Tokyo: Halloween')
    end
  end
end
