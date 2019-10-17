require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  before(:all) do
    @user1 = create(:user, :checo)
    visit('/users')
    fill_in 'user_email', with: @user1.email
    fill_in 'user_password', with: @user1.password
    click_button 'Log in'
    @post = create(:post, :event1)
    @post.user_id=@user1.id
  end

  it "create a comment in a post" do
    user = create(:user,:ines)
    post = create(:post,:event1)
    comment = user.comments.build(content:"This is my rspec test")
    comment.post_id = post.id
    comment.save
    expect(comment).to be_valid
  end
end
