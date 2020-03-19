require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see link to create shelter" do
    visit "/shelters"

    expect(page).to have_content("New Shelter")
  end

  it "can click link then see form to create shelter" do
    visit "/shelters/"

    click_link('New Shelter')

    expect(page).to have_current_path("/shelters/new")
    expect(page).to have_content("Enter a name:")
    expect(page).to have_content("Enter an address:")
    expect(page).to have_content("Enter a city:")
    expect(page).to have_content("Enter a state:")
    expect(page).to have_content("Enter a zip:")
  end

  it "creates a Shelter and redirects to the shelters index page" do
    visit "/shelters/new"

    fill_in('shelter[name]', :with => "Lavender Town Rescue")
    fill_in('shelter[address]', :with => "Route 66")
    fill_in('shelter[city]', :with => "Lavender Town")
    fill_in('shelter[state]', :with => "Kanto")
    fill_in('shelter[zip]', :with => "80810")

    click_button('Create Shelter')

    expect(page).to have_current_path("/shelters")
    expect(page).to have_content("Lavender Town Rescue")
  end
end