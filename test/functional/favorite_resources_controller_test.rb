require 'test_helper'

class FavoriteResourcesControllerTest < ActionController::TestCase
  setup do
    @favorite_resource = favorite_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favorite_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favorite_resource" do
    assert_difference('FavoriteResource.count') do
      post :create, favorite_resource: {  }
    end

    assert_redirected_to favorite_resource_path(assigns(:favorite_resource))
  end

  test "should show favorite_resource" do
    get :show, id: @favorite_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favorite_resource
    assert_response :success
  end

  test "should update favorite_resource" do
    put :update, id: @favorite_resource, favorite_resource: {  }
    assert_redirected_to favorite_resource_path(assigns(:favorite_resource))
  end

  test "should destroy favorite_resource" do
    assert_difference('FavoriteResource.count', -1) do
      delete :destroy, id: @favorite_resource
    end

    assert_redirected_to favorite_resources_path
  end
end
