require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = User.new(email:'newuser@email', password:'password123')
  end

  test "Should not save User with both empty, email and password" do
    @user.email = ''
    @user.password = ''
    assert_not @user.save, 'Saved a user with both empty, email and password'
  end
  test "Should not save User with an empty email" do
    @user.email = ''
    assert_not @user.save, 'Saved a user with an empty email'
  end

  test "Should not save without a proper format for email" do
    @user.email = 'newuser'
    assert_not @user.save, 'Saved a user with wrong email format'
  end

  test "Should not save User with an empty password" do
    @user.password = ''
    assert_not @user.save, 'Saved a user with an empty password'
  end

  test "Should not save User with a password length less than 6" do
    @user.password = '12345'
    assert_not @user.save, 'Saved a user with a password length less than 6'
  end

  test "Should not save User with a password length more than 128" do
    @user.password = '1'*129
    assert_not @user.save, 'Saved a user with a password length more than 128'
  end

  test "Should save User with proper format for email and password" do
    assert @user.save, 'Did not save a user with proper format for email and password'
  end
end
