# require './spec/setup_test_database.rb'
ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'
require File.join(File.dirname(__FILE__), '..' , 'server.rb')

require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::Console,
# Want a nice code coverage website? Uncomment this next line!
# SimpleCov::Formatter::HTMLFormatter
])

SimpleCov.start
Capybara.app = Server

RSpec.configure do |config|

  # config.before(:each) do
  #   setup_test_database
  # end

  config.after(:suite) do
    puts ""
    puts "rspec tests complete"
  end
end
