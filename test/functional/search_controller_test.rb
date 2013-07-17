require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get subject" do
    get :subject
    assert_response :success
  end

  test "should get grade" do
    get :grade
    assert_response :success
  end

  test "should get topic" do
    get :topic
    assert_response :success
  end

  test "should get standard" do
    get :standard
    assert_response :success
  end

  test "should get resource" do
    get :resource
    assert_response :success
  end

end
