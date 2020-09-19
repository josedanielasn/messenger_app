require 'test_helper'

class ChatroomsControllerTest < ActionDispatch::IntegrationTest
  test "Should get index" do
    assert_generates "/", { controller: "chatrooms", action: "index"}
  end
end
