require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit a Pet Show page"
    it "I can see a link to update that Pet, when I click it, I can edit pet data" do
    shelter_1 = Shelter.create(name: "Pallet Town Shelter",
                        address: "Route 1",
                        city:  "Pallet Town",
                        state: "Kanto",
                        zip: "80807")
    pet_1 = Pet.create(image: "pidgey.jpg",
                        name: "Pidgey",
                        description: "Very gentle and loving",
                        age:  4,
                        sex: "Male",
                        status: "Adoptable",
                        shelter_id: shelter_1.id)
    visit "/pets/#{pet_1.id}"

    click_link "Update Pet"

    expect(page).to have_current_path("/pets/#{pet_1.id}/edit")

    fill_in('image', :with => "caterpie.jpg")
    fill_in('name', :with => "Bubbles")
    fill_in('description', :with => "Loves to cuddle")
    fill_in('age', :with => 3)
    fill_in('sex', :with => "Female")

    click_button "Update Pet"

    expect(page).to have_current_path("/pets/#{pet_1.id}")
    expect(page).to have_css("img[src*=caterpie]")
    expect(page).to have_content("Bubbles")
    expect(page).to have_content("Loves to cuddle")
    expect(page).to have_content("3")
    expect(page).to have_content("Female")
    expect(page).to have_content("Adoptable")
  end
end



