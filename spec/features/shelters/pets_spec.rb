require 'rails_helper'

RSpec.describe 'Shelters pets page' do
  it 'see each Pet that can be adopted from that Shelter' do
    shelter1 = Shelter.create!(name: "Mooses Palace", address: "123 Main St",
      city: "Denver", state: "CO", zip: "80005")

    pet1 = shelter1.pets.create!(name: "Ari", approximate_age: 2, sex: "Male",
      image: "ari.jpeg")
    pet2 = shelter1.pets.create!(name: "Axel", approximate_age: 2, sex: "Male",
      image: "axel.jpeg")
      
    visit "/shelters/#{shelter1.id}/pets"

    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.approximate_age)
    expect(page).to have_content(pet1.sex)
    # expect(page).to have_content(shelter1.name)
    expect(page).to have_xpath("//img['ari.jpeg']")

    expect(page).to have_content(pet2.name)
    expect(page).to have_content(pet2.approximate_age)
    expect(page).to have_content(pet2.sex)
    # expect(page).to have_content(shelter2.name)
    expect(page).to have_xpath("//img['axel.jpeg']")
  end
end
