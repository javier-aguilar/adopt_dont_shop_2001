require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see link to create shelter" do
    visit "/shelters"

    expect(page).to have_content("New Shelter")
  end

end