require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  it "see the pet with that id including the pet's information" do
    shelter1 = Shelter.create(name: "Mooses Palace", address: "123 main st", city: "Denver", state: "CO", zip: "80005")

    pet1 = shelter1.pets.create!(name: "Ari", approximate_age: 2, sex: "Male", image: "ari.jpeg")
    pet2 = shelter1.pets.create!(name: "Axel", approximate_age: 2, sex: "Male", image: "axel.jpeg")

    visit "/pets/#{pet1.id}"

    expect(page).to have_xpath("//img['ari.jpeg']")
    expect(page).to have_content("#{pet1.name}")
    expect(page).to have_content("#{pet1.description}")
    expect(page).to have_content("#{pet1.approximate_age}")
    expect(page).to have_content("#{pet1.sex}")
    expect(page).to have_content("#{pet1.adoption_status}")

    expect(page).to_not have_content("#{pet2.name}")
  end
end
