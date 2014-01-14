require 'test_helper'

class MemberControllerTest < ActionController::TestCase
  test "should get showAccountInfo" do
    get :showAccountInfo
    assert_response :success
  end

  test "should get newReviews" do
    get :newReviews
    assert_response :success
  end

  test "should get newRecipes" do
    get :newRecipes
    assert_response :success
  end

  test "should get newItems" do
    get :newItems
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

  test "should get listProducts" do
    get :listProducts
    assert_response :success
  end

  test "should get listMembers" do
    get :listMembers
    assert_response :success
  end

  test "should get listItems" do
    get :listItems
    assert_response :success
  end

  test "should get listEvents" do
    get :listEvents
    assert_response :success
  end

  test "should get listContactInfo" do
    get :listContactInfo
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get eventDetails" do
    get :eventDetails
    assert_response :success
  end

  test "should get editReviews" do
    get :editReviews
    assert_response :success
  end

  test "should get editRecipes" do
    get :editRecipes
    assert_response :success
  end

  test "should get editMember" do
    get :editMember
    assert_response :success
  end

  test "should get editItems" do
    get :editItems
    assert_response :success
  end

  test "should get deleteReviews" do
    get :deleteReviews
    assert_response :success
  end

  test "should get deleteRecipes" do
    get :deleteRecipes
    assert_response :success
  end

  test "should get deleteItems" do
    get :deleteItems
    assert_response :success
  end

end
