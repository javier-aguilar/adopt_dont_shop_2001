require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see all pets" do
    shelter_1 = Shelter.create(name: "Pallet Town Shelter",
                        address: "Route 1",
                        city:  "Pallet Town",
                        state: "Kanto",
                        zip: "80807")

    pet_1 = Pet.create(image: "pidgey.jpg",
                        name: "Pidgey",
                        age:  4,
                        sex: "Male",
                        shelter_id: shelter_1.id)
    pet_2 = Pet.create(image: "weedle.jpg",
                        name: "Weedle",
                        age:  2,
                        sex: "Male",
                        shelter_id: shelter_1.id)
    visit "/pets"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.age)
    expect(page).to have_content(pet_2.sex)
    expect(page).to have_content(shelter_1.name)
  end
end
