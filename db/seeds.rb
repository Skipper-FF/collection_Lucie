# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Component.destroy_all
Pattern.destroy_all
Family.destroy_all
User.destroy_all
Season.destroy_all
Factory.destroy_all
Clothe.destroy_all
TechnicalDetail.destroy_all


component1 = Component.create!(
  element_type: "Main fabrics",
  supplier: "Reda",
  name: "Cotton",
  reference: "WX82",
  description: "Fleece cotton",
  color: "white",
  composition: "100% cotton",
  unit: "Weight",
  unit_price: "8€",
  rating: 4
  )



family1 = Family.create!(
  name: "SWEATS"
  )

pattern1 = Pattern.create!(
  name: "Sleeveless sweatshirt",
  description: "",
  family_id: family1.id,
  )



user1 = User.create!(
  email: "jean@gmail.com",
  password: "jean12345",
  )

season1 = Season.create!(
  name: "AW21",
  user_id: user1.id,
  begining_date: "July 2021",
  ending_date: "January 2022",
  )



factory1 = Factory.create!(
  name: "RGT Textiles",
  address: "Porto",
  speciality: "Sportswear",
  production_capacity: "10 000/mounth",
  moq: "100",
  rating: 4
  )



clothe1 = Clothe.create!(
  factory_id: factory1.id,
  season_id: season1.id,
  pattern_id: pattern1.id,
  name: "Cool Sleeveless sweatshirt",
  reference: "SLSW2",
  quantity: 5000,
  confection_cost: 7,
  total_cost: 35000,
  selling_price: 34
  )


TechnicalDetail.create!(
  clothe_id: clothe1.id,
  component_id: component1.id,
  quantity: 5000,
)



