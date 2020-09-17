require 'test_helper'

class ChatroomsControllerTest < ActionDispatch::IntegrationTest
  test "Should get index" do
    assert_generates "/users/#{users(:newuser_1).id}/messages", { controller: "chatrooms", action: "index", user_id: users(:newuser_1).id}
  end
end
