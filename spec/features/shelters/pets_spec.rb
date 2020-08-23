require 'rails_helper'

RSpec.describe 'Shelters pets index page' do
  it 'see each Pet that can be adopted from that Shelter' do
    shelter1 = Shelter.create!(name: "Mooses Palace", address: "123 Main St",
      city: "Denver", state: "CO", zip: "80005")

    pet1 = shelter1.pets.create!(name: "Ari", approximate_age: 2, sex: "Male", image: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D_-ssNsbP7wA&psig=AOvVaw2auKW-5L8Xb6xZQNcxROVe&ust=1598312346629000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMiNjs-_susCFQAAAAAdAAAAABAF")
    pet2 = shelter1.pets.create!(name: "Axel", approximate_age: 2, sex: "Male", image: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpets.webmd.com%2Fdogs%2Ffeatures%2Fdog-cool-summer&psig=AOvVaw0v-H0ylJHtEr8BDCFN9W8u&ust=1598312421626000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLCi8fK_susCFQAAAAAdAAAAABAE")

    visit "/shelters/#{shelter1.id}/pets"

    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.description)
    expect(page).to have_content(pet1.approximate_age)
    expect(page).to have_content(pet1.sex)
    # expect(page).to have_content(shelter1.name)
    expect(page).to have_css("img[src*=BAF]")

    expect(page).to have_content(pet2.name)
    expect(page).to have_content(pet2.description)
    expect(page).to have_content(pet2.approximate_age)
    expect(page).to have_content(pet2.sex)
    # expect(page).to have_content(shelter2.name)
    expect(page).to have_css("img[src*=BAE]")
  end
end
