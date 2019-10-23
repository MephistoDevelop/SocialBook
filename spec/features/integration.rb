# frozen_string_literal: true

require 'rails_helper'

Rspec.describe Integration do
  before :each do
    User.make(email: 'user@example.com', password: 'password')
  end

  it 'signs me in' do
    visit '/sessions/new'
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end
