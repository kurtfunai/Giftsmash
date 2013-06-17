class AmazonAffiliateController < ApplicationController
  require 'asin'
  include ASIN::Client

  # GET amazon/search/{query}.json
  def search
    client = ASIN::Client.instance
    @amazon_affiliate = AmazonAffiliate.new

    items = @amazon_affiliate.search_keyword(client, params[:query])

    respond_to do |format|
      format.json { render json: items }
    end
  end

  # POST amazon/query
  def get_all
    client = ASIN::Client.instance
    @amazon_affiliate = AmazonAffiliate.new
    # Multiple item lookup: client.lookup ['1430218150','1934356549']
    items = client.lookup(params[:asins])
    items = @amazon_affiliate.format_results(items)

    respond_to do |format|
      format.json { render json: items }
    end
  end

  # GET amazon/lookup/{asin}.json
  def lookup
    client = ASIN::Client.instance
    items = client.lookup URI::escape params[:asin]

    respond_to do |format|
      format.json { render json: items }
    end
  end
end
