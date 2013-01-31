require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "should not save without name" do
    item = items(:one)
    item.name = nil
    assert !item.save
  end

  test "should save with name" do
    item = items(:one)
    item.name = "My List"
    assert item.save
  end

  test "should not save without list" do
    item = items(:one)
    item.list_id = nil
    assert !item.save
  end
end
