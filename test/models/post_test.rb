require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user=User.create(name:"juanito",
                   email:"juanito@gmail.com",
                   password:"123456",
                   password_confirmation:"123456")
    @post = Post.new(content:"this is the test post to validates !!",user_id:1)
  end

  test "content should not be blank" do
    @post.content=""
    assert_not @post.save
  end

  test "email should not be too long" do
    @post.content = "a" * 1001
    assert_not @post.valid?
  end
end
