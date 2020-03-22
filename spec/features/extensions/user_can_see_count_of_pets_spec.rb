require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit a shelter pets index page"
    it "I can see a count of the number of pets at the shelter" do
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
                          age:  4,
                          sex: "Male",
                          status: "Adoptable",
                          shelter_id: shelter_1.id)
      pet_2 = Pet.create(image: "weedle.jpg",
                          name: "Weedle",
                          description: "Weed is a loyal and affectionate friend.",
                          age:  2,
                          sex: "Male",
                          status: "Pending",
                          shelter_id: shelter_1.id)
      pet_3 = Pet.create(image: "chansey.jpg",
                          name: "Chansey",
                          description: "Can be aggressive",
                          age:  5,
                          sex: "Female",
                          status: "Adoptable",
                          shelter_id: shelter_2.id)

      visit "/shelters/#{shelter_1.id}/pets"

      expect(page).to have_content("Available Pokemon (2)")
    end
end