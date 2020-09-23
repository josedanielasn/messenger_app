require "test_helper"

class ChatroomChannelTest < ActionCable::Channel::TestCase
  test "subscribes" do
    # subscribe
    # assert subscription.confirmed?
    # subscribe match_id: "1"
    # assert_has_stream "match_1"
    connect params: { user_id: 1 }
    assert_equal connection.user_id, "1"
  end
end
