require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "Debería dar un index" do
    get home_index_url
    assert_response :success
  end
end
