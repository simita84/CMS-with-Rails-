require 'test_helper'

class AccessControllerTest < ActionController::TestCase
  test "should get attempt_login" do
    get :attempt_login
    assert_response :success
  end


  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get listMembers" do
    get :listMembers
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get menu" do
    get :menu
    assert_response :success
  end

end
