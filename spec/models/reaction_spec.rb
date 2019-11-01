# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reaction, type: :model do
  before(:all) do
    @user = create(:user, :reactor)
    @post = create(:post, :post_controller)
    @reaction = @user.reactions.build
    @reaction.post_id = @post.id
  end

  it 'validates users presence' do
    expect(@reaction).to be_valid
  end

  it 'invalid reaction for null user' do
    @reaction.user_id = nil
    expect(@reaction).to be_valid
  end
end
