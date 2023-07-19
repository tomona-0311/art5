require "test_helper"

class DisplaysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get displays_new_url
    assert_response :success
  end
end
