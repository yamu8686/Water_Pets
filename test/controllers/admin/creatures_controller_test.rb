require "test_helper"

class Admin::CreaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_creatures_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_creatures_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_creatures_edit_url
    assert_response :success
  end
end
