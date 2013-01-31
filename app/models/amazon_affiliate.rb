class AmazonAffiliate

  def search_keyword asin_client, query
    query.strip!
    raise "Query cannot be empty" if query.empty?
    items = asin_client.search :Keywords => query, :SearchIndex => :All, :ResponseGroup => [ :Small, :Images ]
  end

  def parse_items items
    items_with_image = []
    items.each do |item|
      items_with_image << item if item.raw.SmallImage
    end
    
    return items_with_image.slice(0,3) # only return 3 images for now
  end
end
