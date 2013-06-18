require 'test_helper'

class FavoriteBundlesControllerTest < ActionController::TestCase
  setup do
    @favorite_bundle = favorite_bundles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favorite_bundles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favorite_bundle" do
    assert_difference('FavoriteBundle.count') do
      post :create, favorite_bundle: {  }
    end

    assert_redirected_to favorite_bundle_path(assigns(:favorite_bundle))
  end

  test "should show favorite_bundle" do
    get :show, id: @favorite_bundle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favorite_bundle
    assert_response :success
  end

  test "should update favorite_bundle" do
    put :update, id: @favorite_bundle, favorite_bundle: {  }
    assert_redirected_to favorite_bundle_path(assigns(:favorite_bundle))
  end

  test "should destroy favorite_bundle" do
    assert_difference('FavoriteBundle.count', -1) do
      delete :destroy, id: @favorite_bundle
    end

    assert_redirected_to favorite_bundles_path
  end
end
