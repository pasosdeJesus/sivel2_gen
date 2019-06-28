require 'test_helper'

class VisualesControllerTest < ActionController::TestCase
  setup do
    skip
    @visual = Visual(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:visual)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create visual" do
    skip
    assert_difference('Visual.count') do
      post :create, visual: { created_at: @visual.created_at, fechacreacion: @visual.fechacreacion, fechadeshabilitacion: @visual.fechadeshabilitacion, nombre: @visual.nombre, observaciones: @visual.observaciones, updated_at: @visual.updated_at }
    end

    assert_redirected_to visual_path(assigns(:visual))
  end

  test "should show visual" do
    skip
    get :show, id: @visual
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @visual
    assert_response :success
  end

  test "should update visual" do
    skip
    patch :update, id: @visual, visual: { created_at: @visual.created_at, fechacreacion: @visual.fechacreacion, fechadeshabilitacion: @visual.fechadeshabilitacion, nombre: @visual.nombre, observaciones: @visual.observaciones, updated_at: @visual.updated_at }
    assert_redirected_to visual_path(assigns(:visual))
  end

  test "should destroy visual" do
    skip
    assert_difference('Visual.count', -1) do
      delete :destroy, id: @visual
    end

    assert_redirected_to visuales_path
  end
end
