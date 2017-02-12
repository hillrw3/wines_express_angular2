require 'runner'
require 'database_cleaner'

require_relative '../lib/models'
require_relative '../configuration'
require_relative '../lib/object_creation_methods'

RSpec.configure do |config|
  # Default RSpec configs
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.default_formatter = 'doc'

  config.order = :random

  Kernel.srand config.seed

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
    DatabaseCleaner.clean
  end

  config.after(:each) do
    DatabaseCleaner.start
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    Runner.stop
  end
end