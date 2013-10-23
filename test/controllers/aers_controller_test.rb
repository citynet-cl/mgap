require 'test_helper'

class AersControllerTest < ActionController::TestCase
  setup do
    @aer = aers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aer" do
    assert_difference('Aer.count') do
      post :create, aer: { email: @aer.email, password_digest: @aer.password_digest }
    end

    assert_redirected_to aer_path(assigns(:aer))
  end

  test "should show aer" do
    get :show, id: @aer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aer
    assert_response :success
  end

  test "should update aer" do
    patch :update, id: @aer, aer: { email: @aer.email, password_digest: @aer.password_digest }
    assert_redirected_to aer_path(assigns(:aer))
  end

  test "should destroy aer" do
    assert_difference('Aer.count', -1) do
      delete :destroy, id: @aer
    end

    assert_redirected_to aers_path
  end
end
