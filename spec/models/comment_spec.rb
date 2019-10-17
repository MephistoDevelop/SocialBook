require 'rails_helper'

RSpec.describe Comment, type: :model do
    before(:all) do
        
        @comment = FactoryBot.create(:comment).user
    end

    it 'return invalid comment for blank content' do
        @comment.content = ''
        expect(@comment).to_not be_valid
    end

    it 'return valid comment for present comment' do
        @comment.content = 'Test it'
        expect(@comment).to be_valid
    end

    it 'must have an author' do
        @comment.author_id = nil
        expect(@comment).to_not be_valid
    end
end
