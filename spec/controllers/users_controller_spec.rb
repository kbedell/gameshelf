require 'rails_helper'

describe UsersController do
  describe "DELETE destroy" do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    it 'blocks unauthenticated access' do
      sign_in nil

      delete :destroy, id: @user

      expect(response).to redirect_to(new_user_session_path)
    end

    it "deletes the user" do
      sign_in @user
      expect{
        delete :destroy, id: @user.id
      }.to change(User,:count).by(-1)
    end

    it "redirects to users new session" do
      sign_in @user
      delete :destroy, id: @user.id
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
