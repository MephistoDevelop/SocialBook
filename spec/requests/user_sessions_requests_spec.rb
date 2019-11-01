# frozen_string_literal: true

require 'spec_helper'
def valid_facebook_login_setup
  if Rails.env.test?
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      provider: 'facebook',
      uid: '123545',
      info: {
        first_name: 'Gaius',
        last_name: 'Baltar',
        email: 'test@example.com'
      },
      credentials: {
        token: '123456',
        expires_at: Time.now + 1.week
      },
      extra: {
        raw_info: {
          gender: 'male'
        }
      }
    )
  end
end

RSpec.describe "GET '/auth/facebook/callback'" do
  before(:each) do
    valid_facebook_login_setup
    get 'auth/facebook/callback'
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
  end

  it 'should set user_id' do
    expect(session[:user_id]).to eq(User.last.id)
  end

  it 'should redirect to root' do
    expect(response).to redirect_to root_path
  end
end

RSpec.describe "GET '/auth/failure'" do
  it 'should redirect to root' do
    get '/auth/failure'
    expect(response).to redirect_to root_path
  end
end
