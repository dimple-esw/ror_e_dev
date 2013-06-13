require 'test_helper'

class AtriclesControllerTest < ActionController::TestCase
  setup do
    @atricle = atricles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atricles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atricle" do
    assert_difference('Atricle.count') do
      post :create, atricle: { description: @atricle.description, name: @atricle.name }
    end

    assert_redirected_to atricle_path(assigns(:atricle))
  end

  test "should show atricle" do
    get :show, id: @atricle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atricle
    assert_response :success
  end

  test "should update atricle" do
    put :update, id: @atricle, atricle: { description: @atricle.description, name: @atricle.name }
    assert_redirected_to atricle_path(assigns(:atricle))
  end

  test "should destroy atricle" do
    assert_difference('Atricle.count', -1) do
      delete :destroy, id: @atricle
    end

    assert_redirected_to atricles_path
  end
end
