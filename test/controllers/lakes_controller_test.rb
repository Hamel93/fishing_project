require "test_helper"

class LakesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lakes_index_url
    assert_response :success
  end

  test "should get show" do
    get lakes_show_url
    assert_response :success
  end
end
