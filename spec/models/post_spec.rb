require 'rails_helper'

RSpec.describe Post, type: :model do
    before(:all) do
        @user = create(:user, :controller_likes)
        @post = @user.posts.build
    end

    it 'is an invalid post if content is blank' do
        @post.content = nil
        expect(@post).to_not be_valid
    end

    it 'valid post for present content' do
        @post.content = 'Testeamelo'
        expect(@post).to be_valid
    end

    it 'returns invalid post for a post with more than 1000 characters' do
        @post.content = 'a'*1001
        expect(@post).to_not be_valid
    end

    it 'returns valid post for a post with less than 1000 characters' do
        @post.content = 'a'*999
        expect(@post).to be_valid
    end
end