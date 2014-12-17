require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: { altura: @player.altura, apellido: @player.apellido, block: @player.block, city: @player.city, fuerza: @player.fuerza, intensidad: @player.intensidad, jump: @player.jump, mental: @player.mental, nacimiento: @player.nacimiento, nombre: @player.nombre, pass: @player.pass, peso: @player.peso, position: @player.position, potencial: @player.potencial, reb: @player.reb, resist: @player.resist, shotfree: @player.shotfree, shotins: @player.shotins, shotlong: @player.shotlong, shotmed: @player.shotmed, speed: @player.speed, steal: @player.steal, team_id: @player.team_id, teamwork: @player.teamwork }
    end

    assert_redirected_to player_path(assigns(:player))
  end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  test "should update player" do
    patch :update, id: @player, player: { altura: @player.altura, apellido: @player.apellido, block: @player.block, city: @player.city, fuerza: @player.fuerza, intensidad: @player.intensidad, jump: @player.jump, mental: @player.mental, nacimiento: @player.nacimiento, nombre: @player.nombre, pass: @player.pass, peso: @player.peso, position: @player.position, potencial: @player.potencial, reb: @player.reb, resist: @player.resist, shotfree: @player.shotfree, shotins: @player.shotins, shotlong: @player.shotlong, shotmed: @player.shotmed, speed: @player.speed, steal: @player.steal, team_id: @player.team_id, teamwork: @player.teamwork }
    assert_redirected_to player_path(assigns(:player))
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player
    end

    assert_redirected_to players_path
  end
end
