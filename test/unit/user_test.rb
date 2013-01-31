require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should destroy users lists after user is deleted" do
    user = users(:kurt)
    id = user.id
    user.destroy

    lists = List.where(user_id: id)
    #lists = lists(:one) # Which approach is better? This throws a RecordNotFound error. Could use assert_throws( symbol, [msg] ) { block }
    assert lists.empty?
  end
end
