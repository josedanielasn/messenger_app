require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  setup do
    @user = users(:newuser_1)
    @valid_message_body = messages(:newmessage_1)
  end

  test "1. Should not save empty message_body" do
    @valid_message_body.message_body = ''
    assert_not @valid_message_body.save, 'Saved an empty message_body'
  end

  test "2. Should not save message_body with length more than 3000" do
    @valid_message_body.message_body = '1' * 3001
    assert_not @valid_message_body.save, 'Saved a message_body with length more than 3001'
  end

  test "3. Should not save a message_body without a user_id" do
    @new_message = Message.create(message_body:'This is a new message')
    assert_not @new_message.save, 'Saved a message_body without user_id'
  end

  test "4. Should not save a message_body without user_id" do
    @new_message = Message.create(message_body:'This is a new message')
    assert_not @new_message.save, 'Saved a message_body without user_id'
  end

  test "4. Should not save a message_body with an invalid user_id" do
    @new_message = Message.create(message_body:'This is a new message', user_id:1000)
    assert_not @new_message.save, 'Saved a message_body with an invalid user_id'
  end
end
