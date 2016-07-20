module OmniAuthTestHelper
  def valid_amazon_login_setup
    if Rails.env.test?
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:amazon] = OmniAuth::AuthHash.new({
        "provider"=>"amazon",
          "uid"=>"amzn1.account.AHYLKIURDJRJ2KVI736JUWTXUZRA",
          "info"=>{"email"=>"kattrichard@gmail.com", "name"=>"Katherine"},
          "credentials"=>
            {"token"=> "123456",
              "refresh_token"=> "123456",
              "expires_at"=>1469039896,
              "expires"=>true
            },
          "extra"=>{"postal_code"=>nil}})
    end
  end
end
