require 'test_helper'

class JornadasControllerTest < ActionController::TestCase
  setup do
    @jornada = jornadas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jornadas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jornada" do
    assert_difference('Jornada.count') do
      post :create, jornada: { date: @jornada.date, league_id: @jornada.league_id, season_id: @jornada.season_id }
    end

    assert_redirected_to jornada_path(assigns(:jornada))
  end

  test "should show jornada" do
    get :show, id: @jornada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jornada
    assert_response :success
  end

  test "should update jornada" do
    patch :update, id: @jornada, jornada: { date: @jornada.date, league_id: @jornada.league_id, season_id: @jornada.season_id }
    assert_redirected_to jornada_path(assigns(:jornada))
  end

  test "should destroy jornada" do
    assert_difference('Jornada.count', -1) do
      delete :destroy, id: @jornada
    end

    assert_redirected_to jornadas_path
  end
end
