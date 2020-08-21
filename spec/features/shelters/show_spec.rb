# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:
#
# name
# address
# city
# state
# zip
#completed ^

require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  it "see the shelter with that id including the shelter's information" do
    shelter1 = Shelter.create(name: "Mooses Palace", address: "123 main st", city: "Denver", state: "CO", zip: "80005")
    shelter2 = Shelter.create(name: "Moon Souls", address: "555 Lunar way", city: "Arvada", state: "CO", zip: "80012")

    visit "/shelters/#{shelter1.id}"

    expect(page).to have_content("#{shelter1.name}")
    expect(page).to have_content("#{shelter1.address}")
    expect(page).to have_content("#{shelter1.city}")
    expect(page).to have_content("#{shelter1.state}")
    expect(page).to have_content("#{shelter1.zip}")

    expect(page).to_not have_content("#{shelter2.name}")
  end

  it "sees a link to update the shelter" do
    shelter1 = Shelter.create(name: "Mooses Palace", address: "123 main st", city: "Denver", state: "CO", zip: "80005")

    visit "/shelters/#{shelter1.id}"

    expect(page).to have_link("Update Shelter")
    expect(current_path).to eq("/shelters/#{shelter1.id}")
  end
  # As a visitor
  # When I visit a shelter show page
  # Then I see a link to delete the shelter
  # When I click the link "Delete Shelter"
  # Then a 'DELETE' request is sent to '/shelters/:id',
  # the shelter is deleted,
  # and I am redirected to the shelter index page where I no longer see this shelter
  it "see a link to delete shelter" do
    shelter1 = Shelter.create(name: "Paws", address: "123 main st", city: "Denver", state: "CO", zip: "80005")
    shelter2 = Shelter.create(name: "Moon Souls", address: "555 Lunar way", city: "Arvada", state: "CO", zip: "80012")

    visit "/shelters/#{shelter1.id}"



    expect(page).to have_link("Delete Shelter")

    click_link "Delete Shelter"
    save_and_open_page
    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content("#{shelter1.name}")
    expect(page).to have_content("#{shelter2.name}")
  end
end
