require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit /shelters/:shelter_id/pets"
    it "I can see pets that can be adopted from specific shelter" do
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
      pet_3 = Pet.create(image: "chansey.jpg",
                          name: "Chansey",
                          description: "Can be aggressive",
                          approx_age:  5,
                          sex: "Female",
                          status: "Adoptable",
                          shelter_id: shelter_2.id)

      visit "/shelters/#{shelter_1.id}/pets"

      expect(page).to have_css("img[src*=pidgey]")
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.approx_age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_css("img[src*=weedle]")
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(pet_2.approx_age)
      expect(page).to have_content(pet_2.sex)
      expect(page).to have_no_css("img[src*=chansey]")
      expect(page).to have_no_content(pet_3.name)
      expect(page).to have_no_content(pet_3.approx_age)
      expect(page).to have_no_content(pet_3.sex)

      visit "/shelters/#{shelter_2.id}/pets"

      expect(page).to have_css("img[src*=chansey]")
      expect(page).to have_content(pet_3.name)
      expect(page).to have_content(pet_3.approx_age)
      expect(page).to have_content(pet_3.sex)
    end
end