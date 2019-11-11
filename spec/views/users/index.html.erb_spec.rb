# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :view do
  it 'retrieve all users' do
    visit '/users/show'
  end
end
