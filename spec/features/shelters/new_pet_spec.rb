require 'rails_helper'

RSpec.describe "shelters pets index page", type: :feature do
  it "see a link to add a new adoptable pet for that shelter" do
    shelter1 = Shelter.create!(name: "Mooses Palace", address: "123 Main St",
      city: "Denver", state: "CO", zip: "80005")

    visit "/shelters/#{shelter1.id}/pets"

    expect(page).to have_link("Create Pet")
  end

  it "taken to form to add a new adoptable pet" do
    shelter1 = Shelter.create!(name: "Mooses Palace", address: "123 Main St",
      city: "Denver", state: "CO", zip: "80005")

    visit "/shelters/#{shelter1.id}/pets"

    click_link "Create Pet"

    expect(current_path).to eq("/shelters/#{shelter1.id}/pets/new")

    fill_in 'image', with: 'https://i.pinimg.com/736x/92/f4/5c/92f45cc2ae3a4c1aa6835bb2733ad3ea.jpg'
    fill_in 'name', with: 'Ms. Kiss'
    fill_in 'description', with: 'Sweet, furry and loves to cuddle!'
    fill_in 'approximate_age', with: 2
    fill_in 'sex', with: 'Female'

    click_button "Create Pet"

    expect(current_path).to eq("shelters/#{shelter1.id}/pets")
    expect(page).to have_content('Ms. Kiss')
  end
end
