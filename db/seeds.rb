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

# ========= elts communs ===

user1 = User.create!(
  email: "jean@gmail.com",
  password: "jean12345",
)
p user1

family1 = Family.create!(
  name: "SWEATS"
)

factory1 = Factory.create!(
  name: "RGT Textiles",
  address: "Porto",
  speciality: "Sportswear",
  production_capacity: "10 000/month",
  moq: "100",
  rating: 4
)

factory2 = Factory.create!(
  name: "AAC-Textiles",
  address: "Lisbonne",
  speciality: "Sportswear",
  production_capacity: "7 000/month",
  moq: "150",
  rating: 3.5
)


# =========== Cloth example nb 1  =====

season1 = Season.new(
  name: "SS21",
  beginning_date: Date.new(2021,02,01),
  ending_date: Date.new(2021,06,30),
)

season1.user = user1
season1.save
p season1


pattern1 = Pattern.create!(
  name: "Sleeveless sweatshirt",
  description: "",
  family_id: family1.id,
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
  
component2 = Component.create!(
  element_type: "Secondary fabrics",
  supplier: "Reda",
  name: "Polyester",
  reference: "PL24",
  description: "Technical fabrics",
  color: "Gray",
  composition: "90% polyester, 10% elasthane",
  unit: "Length",
  unit_price: "5€",
  rating: 4.5
)

component3 = Component.create!(
  element_type: "Zip",
  supplier: "YKK",
  name: "Funky",
  reference: "MTL-wht",
  description: "Trendy zip",
  color: "Bright inox",
  composition: "Inox",
  unit: "Unit",
  unit_price: "2.5€",
  rating: 4
)

component4 = Component.create!(
  element_type: "Hooded Cord",
  supplier: "Arta",
  name: "Corda",
  reference: "CTN-wht",
  description: "Smooth cord",
  color: "White",
  composition: "Cotton",
  unit: "Unit",
  unit_price: "0.5€",
  rating: 4
)

component5 = Component.create!(
  element_type: "Brand trim",
  supplier: "Trim-Factory",
  name: "Little Tease",
  reference: "BRD456",
  description: "Rectangular patch",
  color: "Black",
  composition: "Leather",
  unit: "Unit",
  unit_price: "0.25€",
  rating: 4
)


TechnicalDetail.create!(
  clothe_id: clothe1.id,
  component_id: component1.id,
  quantity: 0.5,
)

TechnicalDetail.create!(
  clothe_id: clothe1.id,
  component_id: component2.id,
  quantity: 0.3,
)

TechnicalDetail.create!(
  clothe_id: clothe1.id,
  component_id: component3.id,
  quantity: 1,
)

TechnicalDetail.create!(
  clothe_id: clothe1.id,
  component_id: component4.id,
  quantity: 1,
)

TechnicalDetail.create!(
  clothe_id: clothe1.id,
  component_id: component5.id,
  quantity: 1,
)


# =========== Cloth example nb 2 =====

season2 = Season.new(
  name: "AW21",
  beginning_date: Date.new(2021,07,01),
  ending_date: Date.new(2022,01,01),
)

season2.user = user1
season2.save
p season2


pattern2 = Pattern.create!(
  name: "Longsleeve sweatshirt",
  description: "",
  family_id: family1.id,
)


clothe2 = Clothe.create!(
  factory_id: factory2.id,
  season_id: season2.id,
  pattern_id: pattern2.id,
  name: "Hot Longsleeve sweatshirt",
  reference: "LSW1",
  quantity: 10000,
  confection_cost: 12,
  total_cost: 120000,
  selling_price: 45
)

component1b = Component.create!(
  element_type: "Main fabrics",
  supplier: "Reda",
  name: "Cotton",
  reference: "HWX28",
  description: "Hot and fleece cotton",
  color: "Dark gray",
  composition: "100% cotton",
  unit: "Weight",
  unit_price: "10€",
  rating: 4
)
  
component2b = Component.create!(
  element_type: "Secondary fabrics",
  supplier: "Reda",
  name: "Polyester",
  reference: "W-PL24",
  description: "Technical fabrics",
  color: "Gray",
  composition: "90% polyester, 10% elasthane",
  unit: "Length",
  unit_price: "5€",
  rating: 4
)


component3b = Component.create!(
  element_type: "Zip",
  supplier: "YKK",
  name: "Funky",
  reference: "MTL-wht",
  description: "Trendy zip",
  color: "Bright inox",
  composition: "Inox",
  unit: "Uniu",
  unit_price: "2.5€",
  rating: 4
)

component4b = Component.create!(
  element_type: "Cord",
  supplier: "Arta",
  name: "Corda",
  reference: "CTN-wht",
  description: "Smooth cord",
  color: "White",
  composition: "Cotton",
  unit: "Unit",
  unit_price: "0.5€",
  rating: 4
)

component5b = Component.create!(
  element_type: "Brand trim",
  supplier: "Trim-Factory",
  name: "Little Tease",
  reference: "BRD456",
  description: "Rectangular patch",
  color: "Black",
  composition: "Leather",
  unit: "Unit",
  unit_price: "0.25€",
  rating: 4
)

