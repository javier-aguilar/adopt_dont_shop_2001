require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see link to create shelter" do
    visit "/shelters"

    expect(page).to have_content("New Shelter")
  end

  it "can see form to create shelter" do
    visit "/shelters/new"

    expect(page).to have_content("Enter a name:")
    expect(page).to have_content("Enter an address:")
    expect(page).to have_content("Enter a city:")
    expect(page).to have_content("Enter a state:")
    expect(page).to have_content("Enter a zip:")
  end
end