# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before(:all) do
    @user = create(:user, :checo)
    @user2 = create(:user, :ines)
    @user.send_friend_request(@user2)
  end

  it 'get a user requestor' do
    expect(@user.username).to eq(@user2.pending_requests.first.user_requestor.pluck(:username).first)
  end

  it 'get a user requested' do
    expect(@user2.username).to eq(@user2.pending_requests.first.user_requested.pluck(:username).first)
  end
end
