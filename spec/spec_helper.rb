require './spec/database_helper.rb'
ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'
ENV['HTML_PATH'] = Dir.pwd
require File.join(File.dirname(__FILE__), '..', 'server.rb')

require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::Console])

SimpleCov.start
Capybara.app = Server

RSpec.configure do |config|
  config.before(:each) do
    truncate_test_database
    create_test_rows
  end

  config.after(:suite) do
    puts ''
    puts 'rspec tests complete'
  end
end
