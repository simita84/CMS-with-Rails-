require 'test_helper'

class InviteesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get eventinfo" do
    get :eventinfo
    assert_response :success
  end

  test "should get editInvitee" do
    get :editInvitee
    assert_response :success
  end

  test "should get sendEventInvite" do
    get :sendEventInvite
    assert_response :success
  end

  test "should get memberResponseHandler" do
    get :memberResponseHandler
    assert_response :success
  end

  test "should get deleteInvitee" do
    get :deleteInvitee
    assert_response :success
  end

end
