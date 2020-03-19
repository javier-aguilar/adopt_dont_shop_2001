require 'rails_helper'

RSpec.describe "shelters edit page", type: :feature do
  it "can see link to update shelter" do
    shelter_1 = Shelter.create(name: "Pallet Town Shelter",
                        address: "Route 1",
                        city:  "Pallet Town",
                        state: "Kanto",
                        zip: "80807")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content("Update Shelter")
  end

  it "can see form to edit shelter" do
    shelter_1 = Shelter.create(name: "Pallet Town Shelter",
                        address: "Route 1",
                        city:  "Pallet Town",
                        state: "Kanto",
                        zip: "80807")

    visit "/shelters/#{shelter_1.id}/edit"

    expect(page).to have_field("shelter[name]", :with => "#{shelter_1.name}")
    expect(page).to have_field("shelter[address]", :with => "#{shelter_1.address}")
    expect(page).to have_field("shelter[city]", :with => "#{shelter_1.city}")
    expect(page).to have_field("shelter[state]", :with => "#{shelter_1.state}")
    expect(page).to have_field("shelter[zip]", :with => "#{shelter_1.zip}")
  end

  it "updates a shelter and redirects to the shelter show page" do
    shelter = Shelter.create(name: "Pallet Town Shelter",
                        address: "Route 1",
                        city:  "Pallet Town",
                        state: "Kanto",
                        zip: "80807")
    visit "/shelters/#{shelter.id}/edit"

    fill_in('shelter[name]', :with => "Pallet Town Poke Home")
    fill_in('shelter[address]', :with => "#{shelter.address}")
    fill_in('shelter[city]', :with => "#{shelter.city}")
    fill_in('shelter[state]', :with => "#{shelter.state}")
    fill_in('shelter[zip]', :with => "#{shelter.zip}")

    click_button('Create Shelter')

    expect(page).to have_current_path("/shelters/#{shelter.id}")
    expect(page).to have_content("Pallet Town Poke Home")
  end
end