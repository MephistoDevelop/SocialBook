require 'rails_helper'

RSpec.describe Comment, type: :model do
before(:all) do
        @user = create(:user,:controller_comments)
        @post = create(:post,:event1)
        @comment = @user.comments.build(content: "This is my content comment")
        @comment.post_id = @post.id
        @comment.author_id=@user.id
        @comment.save
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
