require "test_helper"

class AssistantControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assistant_index_url
    assert_response :success
  end

  test "should get create" do
    get assistant_create_url
    assert_response :success
  end
end
