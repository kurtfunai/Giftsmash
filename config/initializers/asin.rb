ASIN::Configuration.configure do |config|
  config.secret        = CONFIG[:asin_secret]
  config.key           = CONFIG[:asin_key]
  config.associate_tag = CONFIG[:asin_associate_tag]
end