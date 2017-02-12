require "feature_helper"

base_url = "http://localhost:4201"

feature "Wines", js: true do

  it "says the app works" do
    visit "#{base_url}"


    expect(page).to have_content 'app works!'
  end
end