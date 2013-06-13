require 'test_helper'


class AmazonAffiliateTest < ActiveSupport::TestCase

  def setup
    @client = ASIN::Client.instance
    @client.configure :logger => nil # Prevents response body from printing out
    @amazon = AmazonAffiliate.new
  end  

  test "query cannot be empty" do
    assert_raise(RuntimeError) {
      @amazon.search_keyword @client, ""
    }
    assert_raise(RuntimeError) {
      @amazon.search_keyword @client, " "
    }
  end

  # test "parse_items should remove results without images" do
    
  # end

  test "should query amazon api and retrieve products" do
    VCR.use_cassette('xbox', :tag => :search_keyword) do
      response = @amazon.search_keyword(@client, "xbox")
      assert_not_nil response
    end
  end
end
