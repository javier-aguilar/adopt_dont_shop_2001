require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit the pets index page or a shelter pets index page"
    it "I can click a link to only show adoption-pending pets" do
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
      pet_1 = Pet.create(image: "pidgey.jpg",
                          name: "Pidgey",
                          description: "Very gentle and loving",
                          approx_age:  4,
                          sex: "Male",
                          status: "Adoptable",
                          shelter_id: shelter_1.id)
      pet_2 = Pet.create(image: "weedle.jpg",
                          name: "Weedle",
                          description: "Weed is a loyal and affectionate friend.",
                          approx_age:  2,
                          sex: "Male",
                          status: "Pending",
                          shelter_id: shelter_1.id)
      visit "/shelters/#{shelter_1.id}/pets"

      click_link "Show Adoptable"

      expect(page).to have_content("#{pet_1.name}")
      expect(page).to have_no_content("#{pet_2.name}")

      click_link "Show Pending"

      expect(page).to have_no_content("#{pet_1.name}")
      expect(page).to have_content("#{pet_2.name}")


    end
end