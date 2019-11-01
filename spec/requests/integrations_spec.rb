# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Integrations', type: :request do
  it "signs me in and see user's email" do
    @user = User.create(email: 'user@example.com', password: 'password')
    @friend = User.create(email: 'user1@example.com', password: 'password')
    visit '/users/show'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
    expect(page).to have_content 'user1@example.com'
  end

  it 'sends a friend request' do
    @user = User.create(username: 'user1', email: 'user@example.com', password: 'password')
    @friend = User.create(username: 'user2', email: 'user1@example.com', password: 'password')
    visit '/users/show'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
    expect(page).to have_content 'user1@example.com'
    click_on 'Add Friend user2'
    expect(@friend.friendships.size).eql?(1)
  end

  it 'accepts a friend request' do
    @user = User.create(username: 'friend1', email: 'user@example.com', password: 'password')
    @friend = User.create(username: 'friend2', email: 'user1@example.com', password: 'password')
    visit '/users/show'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
    click_on 'Add Friend friend2'
    click_link 'Logout'
    fill_in 'user_email', with: @friend.email
    fill_in 'user_password', with: @friend.password
    click_button 'Log in'
    expect(page).to have_content 'Friends requests(1)'
    click_link 'Friends requests(1)'
    # click_on "Accept Request"
    expect(@friend.friends.size).eql?(1)
  end

  it 'send successfully a friend request' do
    @user1 = create(:user, :ines)
    @user2 = create(:user, :checo)
    expect(@user2.pending_requests.size).to eq(0)
    @user1.send_friend_request(@user2)
    expect(@user2.pending_requests.size).to eq(0)
  end
end
