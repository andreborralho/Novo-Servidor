require 'test_helper'

class DeletedItemsControllerTest < ActionController::TestCase
  setup do
    @deleted_item = deleted_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deleted_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deleted_item" do
    assert_difference('DeletedItem.count') do
      post :create, deleted_item: { element: @deleted_item.element, table: @deleted_item.table }
    end

    assert_redirected_to deleted_item_path(assigns(:deleted_item))
  end

  test "should show deleted_item" do
    get :show, id: @deleted_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deleted_item
    assert_response :success
  end

  test "should update deleted_item" do
    put :update, id: @deleted_item, deleted_item: { element: @deleted_item.element, table: @deleted_item.table }
    assert_redirected_to deleted_item_path(assigns(:deleted_item))
  end

  test "should destroy deleted_item" do
    assert_difference('DeletedItem.count', -1) do
      delete :destroy, id: @deleted_item
    end

    assert_redirected_to deleted_items_path
  end
end
