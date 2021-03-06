# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:all) do
    @user1 = create(:user)
    visit('/users')
    fill_in 'user_email', with: @user1.email
    fill_in 'user_password', with: @user1.password
    click_button 'Log in'
    @post = create(:post)
  end

  it 'index return all posts' do
    get :index
    expect(response).to redirect_to(new_user_session_path)
  end

  it 'create a post sucesully' do
    redirect_to(action: 'show')
  end

  it 'show post after created it' do
    @post2 = create(:post)
    redirect_to(action: 'show')
  end
end
