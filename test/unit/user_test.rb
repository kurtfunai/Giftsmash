require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup 
    @user = users(:kurt)
    @ability = Ability.new(@user) # CanCan method
  end

  test "should destroy users lists after user is deleted" do
    @user.destroy

    assert_raise(ActiveRecord::RecordNotFound) {
      lists = lists(:kurt_bday_list)
    } 
  end

  # test "user can only delete lists that he owns" do
    
  #   assert @ability.can?(:destroy, List.new(:user => @user))
  #   assert @ability.cannot?(:destroy, List.new)
  # end

  test "user can only delete items that he owns" do
    item = items(:toy_truck)
    assert @ability.can?(:destroy, item)
    #assert @ability.cannot?(:destroy, Item.new)
  end

  test "user can create lists" do 
    assert @ability.can?(:create, List)
  end

  test "user can create items" do
    assert @ability.can?(:create, Item)
  end

end
