require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get monthly" do
    get reports_monthly_url
    assert_response :success
  end
end
