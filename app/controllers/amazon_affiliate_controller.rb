class AmazonAffiliateController < ApplicationController
  require 'asin'
  include ASIN::Client

  # GET
  def search
    client = ASIN::Client.instance
    # items = client.lookup '1430218150'
    items = client.search :Keywords => params[:query], :SearchIndex => :All, :ResponseGroup => [ :Small, :Images ]
    # Response Group Medium is not good for production but contains item price and many more details. 
    # Response Group Small/Images does not include price.
    respond_to do |format|
      format.html { redirect_to @list }
      format.json { render json: items }
    end
  end
end
