require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should destroy users lists after user is deleted" do
    user = users(:kurt)
    id = user.id
    user.destroy

    lists = List.where(user_id: id)
    assert lists.empty?
  end
end
