require "test_helper"

class MealsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get meals_show_url
    assert_response :success
  end

  test "should get new" do
    get meals_new_url
    assert_response :success
  end

  test "should get create" do
    get meals_create_url
    assert_response :success
  end

  test "should get edit" do
    get meals_edit_url
    assert_response :success
  end

  test "should get update" do
    get meals_update_url
    assert_response :success
  end

  test "should get destroy" do
    get meals_destroy_url
    assert_response :success
  end
end
