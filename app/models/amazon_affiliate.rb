class AmazonAffiliate

  def search_keyword(asin_client, query)
    query.strip!
    raise "Query cannot be empty" if query.empty?
    items = asin_client.search :Keywords => query, :SearchIndex => :All, :ResponseGroup => [ :Small, :Images ]
    items = self.parse_items(items)
  end

  def parse_items(items)
    items_with_image = []
    items.each do |item|
      items_with_image << item.raw if item.raw.SmallImage
    end
    return items_with_image.slice(0,3)
  end

  def format_results(items)
    formatted_items = {}
    items.each do |item|
      formatted_items[item.raw.ASIN] = item.raw if item.raw.SmallImage
    end
    return formatted_items
  end
end
