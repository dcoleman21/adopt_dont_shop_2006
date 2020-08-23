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

    fill_in 'image', with: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D_-ssNsbP7wA&psig=AOvVaw2auKW-5L8Xb6xZQNcxROVe&ust=1598312346629000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMiNjs-_susCFQAAAAAdAAAAABAF'
    fill_in 'name', with: 'Ms. Kiss'
    fill_in 'description', with: 'Sweet, furry and loves to cuddle!'
    fill_in 'approximate_age', with: 2
    fill_in 'sex', with: 'Female'

    click_button "Create Pet"

    expect(current_path).to eq("shelters/#{shelter1.id}/pets")
    expect(page).to have_content('Ms. Kiss')
  end
end
