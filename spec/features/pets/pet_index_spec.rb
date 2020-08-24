# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
#
# image (not sure how to implement this yet)
# name
# approximate age
# sex
# name of the shelter where the pet is currently located

require 'rails_helper'

RSpec.describe 'Pets index page' do
  it 'can see each Pet in the system' do
    shelter1 = Shelter.create!(name: "Mooses Palace", address: "123 Main St",
      city: "Denver", state: "CO", zip: "80005")
    shelter2 = Shelter.create!(name: "Moon Souls", address: "555 Lunar way",
      city: "Arvada", state: "CO", zip: "80012")

    pet1 = shelter1.pets.create!(name: "Ari", approximate_age: 2, sex: "Male",
      image: "https://i.pinimg.com/736x/92/f4/5c/92f45cc2ae3a4c1aa6835bb2733ad3ea.jpg")
    pet2 = shelter2.pets.create!(name: "Axel", approximate_age: 2, sex: "Male",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Walter_dog.jpg/480px-Walter_dog.jpg")

    visit "/pets"

    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.approximate_age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(shelter1.name)
    eexpect(page).to have_css("img[src*=3ea]")

    expect(page).to have_content(pet2.name)
    expect(page).to have_content(pet2.approximate_age)
    expect(page).to have_content(pet2.sex)
    expect(page).to have_content(shelter2.name)
    expect(page).to have_css("img[src*=Walter_dog]")
  end
end
