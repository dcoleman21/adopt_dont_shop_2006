# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I see a form to edit the shelter's data including:
#
# name
# address
# city
# state
# zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a PATCH request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info
#completed ^
require 'rails_helper'

RSpec.describe "shelters update page", type: :feature do
  it "see a form to edit the shelter's data" do
    shelter1 = Shelter.create(name: "Mooses Palace", address: "123 main st", city: "Denver", state: "CO", zip: "80005")

    visit "/shelters/#{shelter1.id}"

    click_link "Update Shelter"

    expect(current_path).to eq("/shelters/#{shelter1.id}/edit")

    fill_in "name", with: "Edited Name"
    fill_in "address", with: "Edited Address"
    fill_in "city", with: "Edited City"
    fill_in "state", with: "Edited State"
    fill_in "zip", with: "Edited Zip"

    click_on "Submit"

    expect(page).to have_content("Edited Name")
    expect(page).to have_content("Edited Address")
    expect(page).to have_content("Edited City")
    expect(page).to have_content("Edited State")
    expect(page).to have_content("Edited Zip")
    expect(current_path).to eq("/shelters/#{shelter1.id}")
  end
end
