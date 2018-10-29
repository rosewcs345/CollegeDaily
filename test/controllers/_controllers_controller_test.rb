require 'test_helper'

class ControllersControllerTest < ActionController::TestCase
  setup do
    @_controller = _controllers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:_controllers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create _controller" do
    assert_difference('Controller.count') do
      post :create, _controller: { roster: @_controller.roster }
    end

    assert_redirected_to _controller_path(assigns(:_controller))
  end

  test "should show _controller" do
    get :show, id: @_controller
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @_controller
    assert_response :success
  end

  test "should update _controller" do
    patch :update, id: @_controller, _controller: { roster: @_controller.roster }
    assert_redirected_to _controller_path(assigns(:_controller))
  end

  test "should destroy _controller" do
    assert_difference('Controller.count', -1) do
      delete :destroy, id: @_controller
    end

    assert_redirected_to _controllers_path
  end
end
