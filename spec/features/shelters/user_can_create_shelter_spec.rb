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

RSpec.describe "shelters index page", :type => :request do
  it "creates a Shelter and redirects to the Shelters index" do
    post "/shelters", :params => {
                        :shelter => {
                            name: "Lavender Town Rescue",
                            address: "Route 66",
                            city:  "Lavender Town",
                            state: "Kanto",
                            zip: "80810"
                            }
                          }
    expect(response).to redirect_to("/shelters")
  end
end