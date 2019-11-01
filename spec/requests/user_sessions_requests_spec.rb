require 'rails_helper'

RSpec.describe "UserSessionsRequests", type: :request do
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  let(:user) { User.find_by(email: 'testuser@facebook.com') }


  describe "GET /user_sessions_requests" do
    #before(:each) do
     # request.env['omniauth.auth'] = FactoryBot.create(:auth_hash, :facebook)
      #get :facebook
    #end

    #it "sets a session variable to the OmniAuth auth hash" do
     # request.env["omniauth.auth"][:uid].should == '1234'
    #end
=begin
    before(:each) do
      valid_facebook_login_setup
      get "auth/facebook/callback"
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end

    it "should set user_id" do
      expect(session[:user_id]).to eq(User.last.id)
    end

    it "should redirect to root" do
      expect(response).to redirect_to root_path
    end
  end

  describe "GET 'users/auth/failure'" do

    it "should redirect to root" do
      get "users/sign_in"
      expect(response).to redirect_to root_path
    end
=end
  end
end
