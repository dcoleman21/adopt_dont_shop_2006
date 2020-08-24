require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  it "see the pet with that id including the pet's information" do
    shelter1 = Shelter.create(name: "Mooses Palace", address: "123 main st", city: "Denver", state: "CO", zip: "80005")

    pet1 = shelter1.pets.create!(name: "Ari", approximate_age: 2, sex: "Male", image: "https://i.pinimg.com/736x/92/f4/5c/92f45cc2ae3a4c1aa6835bb2733ad3ea.jpg")
    pet2 = shelter1.pets.create!(name: "Axel", approximate_age: 2, sex: "Male", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Walter_dog.jpg/480px-Walter_dog.jpg")

    visit "/pets/#{pet1.id}"

    expect(page).to have_css("img[src*=3ea]")
    expect(page).to have_content("#{pet1.name}")
    expect(page).to have_content("#{pet1.description}")
    expect(page).to have_content("#{pet1.approximate_age}")
    expect(page).to have_content("#{pet1.sex}")
    expect(page).to have_content("#{pet1.adoption_status}")

    expect(page).to_not have_content("#{pet2.name}")
  end
end
