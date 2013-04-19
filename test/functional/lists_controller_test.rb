require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:kurt)
    @list = lists(:kurt_bday_list)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list" do
    assert_difference('List.count') do
      post :create, list: { description: @list.description, event_date: @list.event_date, title: @list.title }
    end

    assert_redirected_to list_path(assigns(:list))
  end

  test "should show list" do
    get :show, id: @list.slug
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @list
    assert_response :success
  end

  test "should update list" do
    put :update, id: @list, list: { description: @list.description, event_date: @list.event_date, title: @list.title }
    assert_redirected_to list_path(assigns(:list))
  end

  test "should destroy list" do
    assert_difference('List.count', -1) do
      delete :destroy, id: @list
    end

    assert_redirected_to lists_path
  end
end
