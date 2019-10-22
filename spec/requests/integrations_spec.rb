require 'rails_helper'

RSpec.describe "Integrations", type: :request do

  it "signs me in and see user's email" do
      @user=User.create(email: 'user@example.com', password: 'password')
      @friend = User.create(email: 'user1@example.com', password: 'password')
      visit '/users'
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Log in'
      expect(page).to have_content 'user1@example.com'
  end

  it 'sends a friend request' do
    @user=User.create(email: 'user@example.com', password: 'password')
    @friend = User.create(email: 'user1@example.com', password: 'password')
    visit '/users'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
    expect(page).to have_content 'user1@example.com'
    first(:button, 'Add Friend').click
    expect(@friend.friendships.size).eql?(1)
  end

  it 'accepts a friend request' do
    @user=User.create(email: 'user@example.com', password: 'password')
    @friend = User.create(email: 'user1@example.com', password: 'password')
    visit '/users'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
    #first(:button, 'Add Friend').click
    click_button 'Add Friend'
    click_link 'Logout'
    fill_in 'user_email', with: @friend.email
    fill_in 'user_password', with: @friend.password
    click_button 'Log in'
    expect(page).to have_content 'Friends requests: 1'
    click_link 'Friends requests: 1'
    click_button 'Accept Request'
    expect(@friend.friends.size).eql?(1)
  end


end

