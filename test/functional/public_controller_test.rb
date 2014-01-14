require 'test_helper'

class PublicControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get attempt_login" do
    get :attempt_login
    assert_response :success
  end

  test "should get listProducts" do
    get :listProducts
    assert_response :success
  end

  test "should get listReviews" do
    get :listReviews
    assert_response :success
  end

  test "should get listRecipes" do
    get :listRecipes
    assert_response :success
  end

  test "should get listItems" do
    get :listItems
    assert_response :success
  end

  test "should get listContacts" do
    get :listContacts
    assert_response :success
  end

  test "should get newMember" do
    get :newMember
    assert_response :success
  end

end
