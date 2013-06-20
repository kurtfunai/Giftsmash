require "spec_helper"
require 'asin'
include ASIN::Client

describe AmazonAffiliate do
  before(:each) do
    @client = ASIN::Client.instance
    @client.configure :logger => nil # Prevents response body from printing out
    @amazon_affiliate = AmazonAffiliate.new
  end

  context "validation" do
    it "does not allow empty queries" do
      expect{ @amazon_affiliate.query(@client,'') }.to raise_error
      expect{ @amazon_affiliate.query(@client,' ') }.to raise_error
    end
  end

  context "querying" do
    it "queries amazon api and retrieve products" do
      VCR.use_cassette('xbox', :tag => :search_keyword) do
        response = @amazon_affiliate.search_keyword(@client, "xbox")
        assert_not_nil response
      end
    end
  end
end
