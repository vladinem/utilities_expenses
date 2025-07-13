require "test_helper"

class UtilityReadingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get utility_readings_index_url
    assert_response :success
  end

  test "should get new" do
    get utility_readings_new_url
    assert_response :success
  end

  test "should get create" do
    get utility_readings_create_url
    assert_response :success
  end

  test "should get show" do
    get utility_readings_show_url
    assert_response :success
  end
end
