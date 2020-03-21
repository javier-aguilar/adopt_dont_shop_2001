require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "can see pet information" do
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
    pet_2 = Pet.create(image: "weedle.jpg",
                        name: "Weedle",
                        description: "Weed is a loyal and affectionate friend.",
                        age:  2,
                        sex: "Male",
                        status: "Pending",
                        shelter_id: shelter_1.id)
    visit "/pets/#{pet_1.id}"

    expect(page).to have_css("img[src*=pidgey]")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.status)

    expect(page).to have_no_content(pet_2.name)
  end
end