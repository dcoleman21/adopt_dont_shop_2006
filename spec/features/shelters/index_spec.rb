# User Story 2, Shelter Index
#
# As a visitor
# When I visit '/shelters'
# Then I see the name of each shelter in the system

require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelter names" do
    shelter1 = Shelter.create(name: "Mooses Palace", address: "123 main st", city: "Denver", state: "CO", zip: "80005")
    shelter2 = Shelter.create(name: "Moon Souls", address: "555 Lunar way", city: "Arvada", state: "CO", zip: "80012")


    visit "/shelters"

    expect(page).to have_content("#{shelter1.name}")
    expect(page).to have_content("#{shelter2.name}")
  end
end
