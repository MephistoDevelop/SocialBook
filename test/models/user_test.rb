require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user=User.new(name:"juanito",
                   email:"juanito@gmail.com",
                   password:"123456",
                   password_confirmation:"123456")
  end
  test "name should be valid" do
    assert @user.save
  end

  test "name should not be blank" do
    @user.name=""
    assert_not @user.save
  end

  test "emails should not be blank" do
    @user.email=""
    assert_not @user.save
  end

  test "name should be uniqueness" do
    duplicate_user=@user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "regex should validate email" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
