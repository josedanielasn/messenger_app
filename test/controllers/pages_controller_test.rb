require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    assert_generates "/pages/home", { controller: "pages", action: "home"}
  end

end
