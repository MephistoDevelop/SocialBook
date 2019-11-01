# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user, :ines)
    @user2 = create(:user, :checo)
    Friendship.all.delete_all
  end

  it 'test the method send_friend_request' do
    @user1.send_friend_request(@user2)
    expect(@user2.friend_requests.first.id).to eq(Friendship.where(requested_id: @user2.id).ids.first)
  end

  it 'test the method friend_requested' do
    @user1.send_friend_request(@user2)
    expect(@user1.friend_requested?(@user2)).to be_truthy
  end

  it 'test the method friend_requests' do
    expect(@user2.friend_requests.size).to eq(0)
    @user1.send_friend_request(@user2)
    expect(@user2.friend_requests.size).to eq(0)
  end

  it 'test the method friends' do
    expect(@user2.friends.size).to eq(0)
    @user1.send_friend_request(@user2)
    @user2.accept_friend_request(@user1)
    expect(@user2.friends.size).to eq(1)
  end

  it 'test the method unfriend user' do
    expect(@user2.friends.size).to eq(0)
    @user1.send_friend_request(@user2)
    @user2.accept_friend_request(@user1)
    expect(@user2.friends.size).to eq(1)
    @user2.unfriend(@user1)
    expect(@user2.friends.size).to eq(0)
  end

  it 'test the method we_are_friends? to be truth' do
    @user1.send_friend_request(@user2)
    @user2.accept_friend_request(@user1)
    expect(@user1.we_are_friends?(@user2)).to be_truthy
  end

  it 'test the method we_are_friends? to be false' do
    @user1.send_friend_request(@user2)
    expect(@user1.we_are_friends?(@user2)).to be_falsey
  end

  it 'is valid with valid attributes' do
    expect(@user1).to be_valid
  end

  it 'has a unique username' do
    user2 = build(:user, email: 'bob@gmail.com')
    expect(user2).to_not be_valid
  end

  it 'has a unique email' do
    user2 = build(:user, username: 'Bob')
    expect(user2).to_not be_valid
  end

  it 'is not valid without a password' do
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end

  it 'is not valid without a username' do
    user2 = build(:user, username: nil)
    expect(user2).to_not be_valid
  end

  it 'is not valid without an email' do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
  end
end
