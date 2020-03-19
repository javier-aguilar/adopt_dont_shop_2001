require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see link to delete" do
    Shelter.create(name: "Pallet Town Shelter",
                        address: "Route 1",
                        city:  "Pallet Town",
                        state: "Kanto",
                        zip: "80807")
    Shelter.create(name: "Cerulean City Center",
                        address: "Route 5",
                        city:  "Cerulean City",
                        state: "Kanto",
                        zip: "80808")

    visit "/shelters"

    expect(page).to have_content("Delete Shelter")
  end

  it "can delete shelter and redirect to shelter index" do
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

    visit "/shelters/"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)

    find("#shelter-#{shelter_1.id}").click

    expect(page).to have_current_path("/shelters")
    expect(page).to have_no_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
    expect(Shelter.count).to eq(1)
  end
end
