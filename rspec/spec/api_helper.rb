require 'spec_helper'
require 'httparty'
require 'runner'

RSpec.configure do |config|
  config.before(:suite) do
    Runner.run_api
  end
end

# Convenience method to make requests to the Go server
def get(path)
  HTTParty.get(api_url + path)
end

def api_url
  "http://localhost:3001"
end