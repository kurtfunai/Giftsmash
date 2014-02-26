ASIN::Configuration.configure do |config|
  config.secret        = ENV['asin_secret']
  config.key           = ENV['asin_key']
  config.associate_tag = ENV['asin_associate_tag']
end