require 'spec_helper'
require 'runner'
require 'capybara/rspec'

RSpec.configure do |config|
  config.before(:suite) do
    Runner.run_feature
  end

  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

  Capybara.javascript_driver = :chrome
end