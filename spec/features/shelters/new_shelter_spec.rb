# As a visitor
# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new' where I see a form for a new shelter
# When I fill out the form with a new shelter's:
#
# name
# address
# city
# state
# zip
# And I click the button "Create Shelter" to submit the form
# Then a POST request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.

require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "see a link to create a new Shelter" do

    visit '/shelters'

    expect(page).to have_link("New Shelter")
  end

  it "taken to form for new shelter" do

    visit '/shelters'

    click_link "New Shelter"

    expect(current_path).to eq('/shelters/new')

    fill_in "name", with: 'Table Mountain'
    fill_in "address", with: '444 Magic Ln'
    fill_in "city", with: 'Arvada'
    fill_in "state", with: 'CO'
    fill_in "zip", with: '80007'

    click_on "Create Shelter"

    expect(current_path).to eq('/shelters')
    expect(page).to have_content('Table Mountain')
  end
end
