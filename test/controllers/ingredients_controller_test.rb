require "test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get ingredients_create_url
    assert_response :success
  end

  test "should get destroy" do
    get ingredients_destroy_url
    assert_response :success
  end
end
