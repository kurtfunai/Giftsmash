require 'test_helper'

class AmazonAffiliateTest < ActiveSupport::TestCase

  def setup
    @amazon = AmazonAffiliate.new
  end  

  test "query cannot be empty" do
    assert_raise(RuntimeError) {
      @amazon.search_keyword true, ""
    }
    assert_raise(RuntimeError) {
      @amazon.search_keyword true, " "
    }
  end

  test "#parse_items should remove results without images" do
    
  end

end
