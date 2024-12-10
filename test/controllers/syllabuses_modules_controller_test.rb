require "test_helper"

class SyllabusesModulesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get syllabuses_modules_new_url
    assert_response :success
  end

  test "should get create" do
    get syllabuses_modules_create_url
    assert_response :success
  end

  test "should get edit" do
    get syllabuses_modules_edit_url
    assert_response :success
  end

  test "should get update" do
    get syllabuses_modules_update_url
    assert_response :success
  end

  test "should get destroy" do
    get syllabuses_modules_destroy_url
    assert_response :success
  end
end
