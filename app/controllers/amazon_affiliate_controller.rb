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
      format.html { redirect_to @list }
      format.json { render json: items }
    end
  end
end
