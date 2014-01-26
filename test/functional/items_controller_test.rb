require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
    assert_template :index
    assert_template layout: "layouts/admin"
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { content: @item.content, member_username: @item.member_username, name: @item.name }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    put :update, id: @item, item: { content: @item.content, member_username: @item.member_username, name: @item.name }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
