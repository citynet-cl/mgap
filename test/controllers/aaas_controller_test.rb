require 'test_helper'

class AaasControllerTest < ActionController::TestCase
  setup do
    @aaa = aaas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aaas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aaa" do
    assert_difference('Aaa.count') do
      post :create, aaa: { name: @aaa.name, number: @aaa.number }
    end

    assert_redirected_to aaa_path(assigns(:aaa))
  end

  test "should show aaa" do
    get :show, id: @aaa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aaa
    assert_response :success
  end

  test "should update aaa" do
    patch :update, id: @aaa, aaa: { name: @aaa.name, number: @aaa.number }
    assert_redirected_to aaa_path(assigns(:aaa))
  end

  test "should destroy aaa" do
    assert_difference('Aaa.count', -1) do
      delete :destroy, id: @aaa
    end

    assert_redirected_to aaas_path
  end
end
