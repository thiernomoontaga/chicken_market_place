require "test_helper"

class FarmersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get farmers_index_url
    assert_response :success
  end

  test "should get show" do
    get farmers_show_url
    assert_response :success
  end

  test "should get new" do
    get farmers_new_url
    assert_response :success
  end

  test "should get edit" do
    get farmers_edit_url
    assert_response :success
  end

  test "should get create" do
    get farmers_create_url
    assert_response :success
  end

  test "should get update" do
    get farmers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get farmers_destroy_url
    assert_response :success
  end
end
