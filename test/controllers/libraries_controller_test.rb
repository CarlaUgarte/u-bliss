require "test_helper"

class LibrariesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get libraries_new_url
    assert_response :success
  end

  test "should get create" do
    get libraries_create_url
    assert_response :success
  end
end
