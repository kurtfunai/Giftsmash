ENV["RAILS_ENV"] ||= 'test'

require 'coveralls'
Coveralls.wear!

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'webmock/test_unit'
require 'vcr'

HTTPI.log = false
VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = {
      :match_requests_on => [:method,
        VCR.request_matchers.uri_without_params(:Timestamp, :Version, :Signature)]
    }
   c.filter_sensitive_data('<AWSAccessKeyId>', :search_keyword) { CONFIG[:asin_key] }
   c.filter_sensitive_data('<AssociateTag>', :search_keyword) { CONFIG[:asin_associate_tag] }
end

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # Include Devise helper for controllers
  config.include Devise::TestHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller

  # Factory Girl
  config.include FactoryGirl::Syntax::Methods

  # in RSpec 3 this will no longer be necessary for VCR.
  config.treat_symbols_as_metadata_keys_with_true_values = true
end
