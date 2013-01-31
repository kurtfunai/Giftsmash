require 'test_helper'

class ListTest < ActiveSupport::TestCase

  test "should not save without title and user" do
    list = List.new
    assert !list.save
  end

  test "save list with title and user" do
    user = users(:kurt)
    list = List.new
    list.title = "My list!"
    list.user = user

    assert list.save
  end

  test "create list slug" do
    list = lists(:one)
    assert_not_nil list.date_and_user_id()
  end

  test "should generate friendly id" do 
    list = List.new
    assert list.should_generate_new_friendly_id?
  end

  test "should not generate friendly id" do
    list = lists(:one)
    assert !list.should_generate_new_friendly_id?
  end

  test "found using friendly id" do
    param = '55d7cb98b79fbad510ccf60f6d565792c5a7ba12'
    list = lists(:one)
    assert list.found_using_friendly_id?(param)
  end

  test "not found using friendly id" do
    list = lists(:one)
    assert !list.found_using_friendly_id?(list.id)
  end

  test "should delete items when list is destroyed" do
    list = lists(:one)
    list_id = list.id
    list.destroy

    assert_raise(ActiveRecord::RecordNotFound) {
      items = items(:one)
    }
  end

end
