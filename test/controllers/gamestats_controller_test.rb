require 'test_helper'

class GamestatsControllerTest < ActionController::TestCase
  setup do
    @gamestat = gamestats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gamestats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gamestat" do
    assert_difference('Gamestat.count') do
      post :create, gamestat: { assistencias: @gamestat.assistencias, faltas: @gamestat.faltas, faltasrecibidas: @gamestat.faltasrecibidas, match_id: @gamestat.match_id, minutos: @gamestat.minutos, perdidas: @gamestat.perdidas, player_id: @gamestat.player_id, puntos: @gamestat.puntos, rebotes: @gamestat.rebotes, rebotesoff: @gamestat.rebotesoff, robos: @gamestat.robos, t1: @gamestat.t1, t1a: @gamestat.t1a, t2: @gamestat.t2, t2a: @gamestat.t2a, t3: @gamestat.t3, t3a: @gamestat.t3a, tapones: @gamestat.tapones, team_id: @gamestat.team_id, valoracion: @gamestat.valoracion }
    end

    assert_redirected_to gamestat_path(assigns(:gamestat))
  end

  test "should show gamestat" do
    get :show, id: @gamestat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gamestat
    assert_response :success
  end

  test "should update gamestat" do
    patch :update, id: @gamestat, gamestat: { assistencias: @gamestat.assistencias, faltas: @gamestat.faltas, faltasrecibidas: @gamestat.faltasrecibidas, match_id: @gamestat.match_id, minutos: @gamestat.minutos, perdidas: @gamestat.perdidas, player_id: @gamestat.player_id, puntos: @gamestat.puntos, rebotes: @gamestat.rebotes, rebotesoff: @gamestat.rebotesoff, robos: @gamestat.robos, t1: @gamestat.t1, t1a: @gamestat.t1a, t2: @gamestat.t2, t2a: @gamestat.t2a, t3: @gamestat.t3, t3a: @gamestat.t3a, tapones: @gamestat.tapones, team_id: @gamestat.team_id, valoracion: @gamestat.valoracion }
    assert_redirected_to gamestat_path(assigns(:gamestat))
  end

  test "should destroy gamestat" do
    assert_difference('Gamestat.count', -1) do
      delete :destroy, id: @gamestat
    end

    assert_redirected_to gamestats_path
  end
end
