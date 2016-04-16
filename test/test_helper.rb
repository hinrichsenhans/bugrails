ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # http://stackoverflow.com/questions/1574797/how-to-load-dbseed-data-into-test-database-automatically
  puts "loading seeds"
  Rails.application.load_seed
  puts Status.all.inspect
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
