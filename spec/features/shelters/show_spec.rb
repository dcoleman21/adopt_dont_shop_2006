# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:
#
# name
# address
# city
# state
# zip

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
end
