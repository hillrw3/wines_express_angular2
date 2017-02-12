require "feature_helper"

feature "Wines", js: true do

  it "displays a list of wines" do
    create_wine(varietal: 'Chardonnay')
    create_wine(varietal: 'Pinot Noir')
    create_wine(varietal: 'Cabernet Franc')

    visit_route '/wines'

    within('ul.wines') do
      expect(page).to have_content 'Chardonnay'
      expect(page).to have_content 'Pinot Noir'
      expect(page).to have_content 'Cabernet Franc'
    end
  end
end