require 'test_helper'

class ShowsControllerTest < ActionController::TestCase
  setup do
    @show = bands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create band" do
    assert_difference('Band.count') do
      post :create, show: { date: @show.date, description: @show.description, name: @show.name }
    end

    assert_redirected_to band_path(assigns(:show))
  end

  test "should show band" do
    get :show, id: @show
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @show
    assert_response :success
  end

  test "should update band" do
    put :update, id: @show, show: { date: @show.date, description: @show.description, name: @show.name }
    assert_redirected_to band_path(assigns(:show))
  end

  test "should destroy band" do
    assert_difference('Band.count', -1) do
      delete :destroy, id: @show
    end

    assert_redirected_to bands_path
  end
end
