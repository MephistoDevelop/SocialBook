# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Integrations', type: :request do
  let(:user) { create(:user) }
  let(:friend) { create(:user) }

  it "signs me in and see user's email" do
    visit '/users/show'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_content 'Logout'
  end

  it 'sends a friend request' do
    expect(friend.pending_requests.size).eql?(0)
    visit '/users/show'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    click_button("Add Friend #{friend.username}", match: :first)
    expect(friend.pending_requests.size).eql?(1)
  end

  it 'accepts a friend request' do
    user.send_friend_request(friend)
    expect(friend.friends.size).eql?(0)
    visit '/users/show'
    fill_in 'user_email', with: friend.email
    fill_in 'user_password', with: friend.password
    click_button 'Log in'
    visit '/friendrequests'
    find_button('Accept Request').click
    expect(friend.friends.size).eql?(1)
  end

  it 'log in with facebook' do
    user = create(:user)
    post '/users/auth/facebook/callback', params: { name: user.name, email: user.email }
    session['user_id'] = user.id
    expect(@response.cookies[Rails.application.config.session_options[:key]].nil?).to eql(false)
    assert_equal user.id, session[:user_id]
  end
end
