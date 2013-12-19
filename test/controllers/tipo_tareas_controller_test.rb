require 'test_helper'

class TipoTareasControllerTest < ActionController::TestCase
  setup do
    @tipo_tarea = tipo_tareas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_tareas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_tarea" do
    assert_difference('TipoTarea.count') do
      post :create, tipo_tarea: { nombre: @tipo_tarea.nombre }
    end

    assert_redirected_to tipo_tarea_path(assigns(:tipo_tarea))
  end

  test "should show tipo_tarea" do
    get :show, id: @tipo_tarea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_tarea
    assert_response :success
  end

  test "should update tipo_tarea" do
    patch :update, id: @tipo_tarea, tipo_tarea: { nombre: @tipo_tarea.nombre }
    assert_redirected_to tipo_tarea_path(assigns(:tipo_tarea))
  end

  test "should destroy tipo_tarea" do
    assert_difference('TipoTarea.count', -1) do
      delete :destroy, id: @tipo_tarea
    end

    assert_redirected_to tipo_tareas_path
  end
end
