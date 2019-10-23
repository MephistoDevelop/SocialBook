# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before(:all) do
    @user = create(:user, :friendship_requestor)
    @user2 = create(:user, :friendship_requested)
  end

  it 'get a user requestor' do
    @user.send_friend_request(@user2)
    expect(@user.username).to eq(@user2.friend_requests.first.user_requestor.pluck(:username).first)
  end

  it 'get a user requested' do
    @user.send_friend_request(@user2)
    expect(@user2.username).to eq(@user2.friend_requests.first.user_requested.pluck(:username).first)
  end
end
