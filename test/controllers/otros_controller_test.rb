require 'test_helper'

class OtrosControllerTest < ActionController::TestCase
  setup do
    @otro = otros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:otros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create otro" do
    assert_difference('Otro.count') do
      post :create, otro: { descripcion: @otro.descripcion, nombre: @otro.nombre }
    end

    assert_redirected_to otro_path(assigns(:otro))
  end

  test "should show otro" do
    get :show, id: @otro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @otro
    assert_response :success
  end

  test "should update otro" do
    patch :update, id: @otro, otro: { descripcion: @otro.descripcion, nombre: @otro.nombre }
    assert_redirected_to otro_path(assigns(:otro))
  end

  test "should destroy otro" do
    assert_difference('Otro.count', -1) do
      delete :destroy, id: @otro
    end

    assert_redirected_to otros_path
  end
end
