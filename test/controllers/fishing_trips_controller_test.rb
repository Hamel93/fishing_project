require "test_helper"

class FishingTripsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fishing_trips_index_url
    assert_response :success
  end

  test "should get show" do
    get fishing_trips_show_url
    assert_response :success
  end

  test "should get new" do
    get fishing_trips_new_url
    assert_response :success
  end

  test "should get edit" do
    get fishing_trips_edit_url
    assert_response :success
  end
end
