require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @toy_truck = items(:toy_truck)
    @new_item = Item.new
  end

  test "should not save without attributes" do
    assert !@new_item.valid?
    assert @new_item.errors[:name].any?
    assert @new_item.errors[:list_id].any?
  end

end
