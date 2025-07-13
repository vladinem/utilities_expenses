require "test_helper"

class MaterialPurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get material_purchases_index_url
    assert_response :success
  end

  test "should get new" do
    get material_purchases_new_url
    assert_response :success
  end

  test "should get create" do
    get material_purchases_create_url
    assert_response :success
  end

  test "should get show" do
    get material_purchases_show_url
    assert_response :success
  end
end
