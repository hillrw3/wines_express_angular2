require "api_helper"

describe 'ping' do
  it 'returns pong' do
    response = get('/ping')

    expect(response.body).to eq({ pong: true }.to_json)
  end

  it 'returns a 200 status' do
    response = get('/ping')

    expect(response.code).to eq(200)
  end
end