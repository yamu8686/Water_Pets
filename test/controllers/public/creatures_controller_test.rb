require "test_helper"

class Public::CreaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_creatures_index_url
    assert_response :success
  end

  test "should get show" do
    get public_creatures_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_creatures_edit_url
    assert_response :success
  end
end
