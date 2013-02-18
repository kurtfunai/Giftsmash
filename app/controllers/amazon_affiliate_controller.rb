class AmazonAffiliateController < ApplicationController
  require 'asin'
  include ASIN::Client

  # GET amazon/search/{query}.json
  def search
    client = ASIN::Client.instance
    @amazon_affiliate = AmazonAffiliate.new
    
    items = @amazon_affiliate.search_keyword client, params[:query]
    items = @amazon_affiliate.parse_items items
    
    respond_to do |format|
      format.json { render json: items }
    end
  end

  # POST amazon/query
  def query
    client = ASIN::Client.instance
    @amazon_affiliate = AmazonAffiliate.new
    #items = client.lookup ['1430218150','1934356549'] #demo of multiple item lookup.
    items = client.lookup params[:asins]
    items = @amazon_affiliate.format_results items
    
    respond_to do |format|
      format.json { render json: items }
    end
  end

  # GET amazon/lookup/{asin}.json
  def lookup
    client = ASIN::Client.instance
    items = client.lookup URI::escape params[:asin] #demo of multiple item lookup.
    
    respond_to do |format|
      format.json { render json: items }
    end
  end
end
