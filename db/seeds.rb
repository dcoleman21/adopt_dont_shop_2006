# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Shelters
Pet.destroy_all
Shelter.destroy_all
shelter1 = Shelter.create(name: "Mooses Palace", address: "123 Main St", city: "Denver", state: "CO", zip: "80005")
shelter2 = Shelter.create(name: "Moon Souls", address: "555 Lunar way", city: "Arvada", state: "CO", zip: "80012")

pet1 = Pet.create(name: "Ari", approximate_age: 2, sex: "Male", image: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D_-ssNsbP7wA&psig=AOvVaw2auKW-5L8Xb6xZQNcxROVe&ust=1598312346629000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMiNjs-_susCFQAAAAAdAAAAABAF", shelter_id: shelter1.id)
pet2 = Pet.create(name: "Axel", approximate_age: 2, sex: "Male", image: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpets.webmd.com%2Fdogs%2Ffeatures%2Fdog-cool-summer&psig=AOvVaw0v-H0ylJHtEr8BDCFN9W8u&ust=1598312421626000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLCi8fK_susCFQAAAAAdAAAAABAE", shelter_id: shelter2.id)
