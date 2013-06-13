ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'webmock/test_unit'
require 'vcr'

HTTPI.log = false

VCR.configure do |c|
   c.allow_http_connections_when_no_cassette = true
   c.cassette_library_dir = 'test/vcr_cassettes'
   c.hook_into :webmock
   c.default_cassette_options = {
      :match_requests_on => [:method,
        VCR.request_matchers.uri_without_params(:Timestamp, :Version, :Signature)]
    }
   c.filter_sensitive_data('<AWSAccessKeyId>', :search_keyword) { CONFIG[:asin_key] }
   c.filter_sensitive_data('<AssociateTag>', :search_keyword) { CONFIG[:asin_associate_tag] }
 end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::TestHelpers
end