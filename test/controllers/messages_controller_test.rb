require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "1. should get create" do
    post "/users/messages", params:{messages:{message_body:'This is a new quote', user_id: users(:newuser_1).id}}
    assert_response :redirect
  end
end
