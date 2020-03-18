require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters" do
    shelter_1 = Shelter.create(name: "Pallet Town Shelter",
                        address: "Route 1",
                        city:  "Pallet Town",
                        state: "Kanto",
                        zip: "80807")
    shelter_2 = Shelter.create(name: "Cerulean City Center",
                        address: "Route 5",
                        city:  "Cerulean City",
                        state: "Kanto",
                        zip: "80808")
    shelter_3 = Shelter.create(name: "Safari Zone Rescue",
                        address: "Route 48",
                        city:  "Fuchsia City",
                        state: "Kanto",
                        zip: "80809")
    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(shelter_3.name)
  end
end
