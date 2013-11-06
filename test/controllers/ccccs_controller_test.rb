require 'test_helper'

class CcccsControllerTest < ActionController::TestCase
  setup do
    @cccc = ccccs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ccccs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cccc" do
    assert_difference('Cccc.count') do
      post :create, cccc: { algo: @cccc.algo, edad: @cccc.edad, hm: @cccc.hm, nacimiento: @cccc.nacimiento, nombre: @cccc.nombre }
    end

    assert_redirected_to cccc_path(assigns(:cccc))
  end

  test "should show cccc" do
    get :show, id: @cccc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cccc
    assert_response :success
  end

  test "should update cccc" do
    patch :update, id: @cccc, cccc: { algo: @cccc.algo, edad: @cccc.edad, hm: @cccc.hm, nacimiento: @cccc.nacimiento, nombre: @cccc.nombre }
    assert_redirected_to cccc_path(assigns(:cccc))
  end

  test "should destroy cccc" do
    assert_difference('Cccc.count', -1) do
      delete :destroy, id: @cccc
    end

    assert_redirected_to ccccs_path
  end
end
