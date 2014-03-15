source 'https://rubygems.org'

gem 'rails', '3.2.17'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'better_errors'

  # Guard
  # gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i 
  # gem 'guard-test'
  # gem 'guard-livereload'
end

group :test do 
  # API testing
  gem 'rake'
  gem 'webmock', '~> 1.9.0'
  gem 'vcr'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'pry'
  gem 'pry-remote'
end

group :production do
  # gem 'mysql2'
  gem 'unicorn'
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # Design
  gem 'therubyracer', :platforms => :ruby
  gem 'twitter-bootstrap-rails', '2.2.4'
  gem 'less-rails'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'coveralls', require: false

# For Authentication
gem 'devise'
gem 'cancan'
gem 'omniauth-twitter'
#gem 'omniauth-facebook'

# For Routing ( List slugs )
gem 'friendly_id'
# For Amazon Affiliate API
gem 'asin'
gem 'httpclient'
# ENV vars
gem 'figaro'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
