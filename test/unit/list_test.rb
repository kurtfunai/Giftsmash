require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "should not save without user" do
    list = List.new
    assert !list.save
  end
end
