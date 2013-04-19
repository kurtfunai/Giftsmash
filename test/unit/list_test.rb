require 'test_helper'

class ListTest < ActiveSupport::TestCase
  def setup
    @kurt_bday_list = lists(:kurt_bday_list)
    @new_list = List.new
  end

  test "should not save without title and user" do
    assert !@new_list.valid?
    assert @new_list.errors[:title].any?
    assert @new_list.errors[:user_id].any?
  end

  test "save list with title and user" do
    @new_list.title = "My list!"
    @new_list.user = users(:kurt)

    assert @new_list.save
  end

  test "create list slug" do
    assert_not_nil @kurt_bday_list.date_and_user_id()
  end

  test "should generate friendly id" do 
    assert @new_list.should_generate_new_friendly_id?
  end

  test "should not generate friendly id" do
    assert !@kurt_bday_list.should_generate_new_friendly_id?
  end

  test "found using friendly id" do
    assert @kurt_bday_list.found_using_friendly_id?(@kurt_bday_list.slug)
  end

  test "not found using friendly id" do
    assert !@kurt_bday_list.found_using_friendly_id?(@kurt_bday_list.id)
  end

  test "should delete items when list is destroyed" do
    @kurt_bday_list.destroy
    assert_raise(ActiveRecord::RecordNotFound) {
      items(:toy_truck)
    }
  end

end
