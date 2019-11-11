# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reaction, type: :model do
  before(:all) do
    @user = create(:user)
    @post = create(:post, user: @user)
    @reaction = create(:reaction, post: @post)
  end

  it 'validates users presence' do
    @reaction.user_id = @user.id
    expect(@reaction).to be_valid
  end

  it 'invalid reaction for null user' do
    @reaction.user_id = nil
    expect(@reaction).not_to be_valid
  end
end
