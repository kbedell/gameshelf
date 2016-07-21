# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'support/database_cleaner'
require 'capybara/rails'
require 'valid_attribute'
require 'capybara/poltergeist'
require 'support/wait_for_ajax'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
include OmniAuthTestHelper

ActiveRecord::Migration.maintain_test_schema!

Capybara.javascript_driver = :webkit
Capybara.default_max_wait_time = 5

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.mock_with :mocha

  config.include Warden::Test::Helpers
   config.before :suite do
     Warden.test_mode!
   end

   config.after :each do
     Warden.test_reset!
   end
end

Capybara::Webkit.configure do |config|
   config.allow_url("https://fonts.googleapis.com/css?family=Oswald|Raleway")
   config.allow_url("https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css")
   config.allow_url("fonts.googleapis.com")
   config.allow_url("https://fonts.googleapis.com/css?family=Oswald%7CRaleway")
 end
