require 'rails_helper'

describe "GET '/auth/amazon/callback'" do
  before(:each) do
    OmniAuth.config.mock_auth[:amazon] = nil
    valid_amazon_login_setup
    get '/users/auth/amazon/callback'
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:amazon]
  end

  it 'should set user_id, and provider' do
    expect(session['warden.user.user.key'][0][0]).to eq(User.last.id)
  end

  it 'should redirect to root' do
    expect(response).to redirect_to usersgames_path
  end
end
