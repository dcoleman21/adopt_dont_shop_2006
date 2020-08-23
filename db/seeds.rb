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

pet1 = Pet.create(name: "Ari", approximate_age: 2, sex: "Male", image: "ari.jpeg", shelter_id: shelter1.id)
pet2 = Pet.create(name: "Axel", approximate_age: 2, sex: "Male", image: "axel.jpeg", shelter_id: shelter2.id)
