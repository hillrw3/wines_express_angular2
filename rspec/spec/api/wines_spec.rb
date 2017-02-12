require 'api_helper'

describe 'Wines' do
  describe 'GET /wines' do
    it 'returns a list of wines' do
      create_wine(varietal: 'Chardonnay')
      create_wine(varietal: 'Pinot Noir')
      create_wine(varietal: 'Cabernet Franc')

      wines = Wines.all.to_json

      response = get('/wines')

      expect(response.body).to match(wines)
    end
  end
end