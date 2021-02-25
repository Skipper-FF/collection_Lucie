# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TechnicalDetail.destroy_all
Component.destroy_all
Clothe.destroy_all
Pattern.destroy_all
Family.destroy_all
Season.destroy_all
User.destroy_all
Factory.destroy_all


# ========= elts communs ===

user1 = User.create!(
  email: "jean@gmail.com",
  password: "jean12345",
)
p user1


season1 = Season.new(
  name: "SS21",
  beginning_date: Date.new(2021,02,01),
  ending_date: Date.new(2021,06,30),
)

season1.user = user1
season1.save
p season1


season2 = Season.new(
  name: "AW21",
  beginning_date: Date.new(2021,07,01),
  ending_date: Date.new(2022,01,01),
)

season2.user = user1
season2.save
p season2


family1 = Family.create!(
  name: "SWEATS"
)

family2 = Family.create!(
  name: "JEANS"
)

family3 = Family.create!(
  name: "COATS"
)

family4 = Family.create!(
  name: "SHIRTS"
)

factory1 = Factory.create!(
  name: "RGT Textiles",
  address: "Porto (Portugal)",
  speciality: "Sportswear",
  production_capacity: 10000,
  moq: "100",
  rating: 4
)

factory2 = Factory.create!(
  name: "AAC-Textiles",
  address: "Lisbonne (Portugal)",
  speciality: "Sportswear",
  production_capacity: 7000,
  moq: "150",
  rating: 3.5
)


factory3 = Factory.create!(
  name: "BFIELD",
  address: "Łódź (Poland)",
  speciality: "Jeans",
  production_capacity: 10000,
  moq: "1000",
  rating: 4
)

factory4 = Factory.create!(
  name: "M-Corp",
  address: "Łask (Poland)",
  speciality: "Coats",
  production_capacity: 5000,
  moq: "500",
  rating: 4.5
)

factory5 = Factory.create!(
  name: "Baltic SC",
  address: "Kaunas (Lithuania)",
  speciality: "Shirts",
  production_capacity: 15000,
  moq: "1000",
  rating: 4
)

factoryfamily1 = FactoryFamily.create!(
  factory_id: factory1.id,
  family_id: family1.id
)

factoryfamily2 = FactoryFamily.create!(
  factory_id: factory2.id,
  family_id: family1.id
)

factoryfamily3 = FactoryFamily.create!(
  factory_id: factory3.id,
  family_id: family2.id
)

factoryfamily4 = FactoryFamily.create!(
  factory_id: factory4.id,
  family_id: family3.id
)

factoryfamily5 = FactoryFamily.create!(
  factory_id: factory5.id,
  family_id: family4.id
)

# =========== Cloth example nb 1  =====

pattern1 = Pattern.create!(
  name: "Sleeveless sweatshirt",
  description: "",
  family_id: family1.id,
)


clothe1 = Clothe.create!(
  factory_id: factory1.id,
  season_id: season1.id,
  pattern_id: pattern1.id,
  name: "Cool sweatshirt",
  reference: "SLSW2",
  quantity: 5000,
  confection_cost: 7,
  total_cost: 35000,
  selling_price: 34
)

component1 = Component.create!(
  element_type: "Main fabric",
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
  element_type: "Secondary fabric",
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
  element_type: "Trim",
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
  element_type: "Trim",
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
  element_type: "Main fabric",
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
  element_type: "Secondary fabric",
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
  element_type: "Trim",
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

component4b = Component.create!(
  element_type: "Trim",
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


TechnicalDetail.create!(
  clothe_id: clothe2.id,
  component_id: component1b.id,
  quantity: 0.5,
)

TechnicalDetail.create!(
  clothe_id: clothe2.id,
  component_id: component2b.id,
  quantity: 0.3,
)

TechnicalDetail.create!(
  clothe_id: clothe2.id,
  component_id: component3b.id,
  quantity: 1,
)

TechnicalDetail.create!(
  clothe_id: clothe2.id,
  component_id: component4b.id,
  quantity: 1,
)

TechnicalDetail.create!(
  clothe_id: clothe2.id,
  component_id: component5b.id,
  quantity: 1,
)


# =========== Cloth example nb 3  =====

pattern3 = Pattern.create!(
  name: "Regular jeans",
  description: "",
  family_id: family2.id,
)

clothe3 = Clothe.create!(
  factory_id: factory3.id,
  season_id: season2.id,
  pattern_id: pattern3.id,
  name: "Hot and thick jeans",
  reference: "RJ430",
  quantity: 15000,
  confection_cost: 9,
  total_cost: 135000,
  selling_price: 35
)


componentAA = Component.create!(
  element_type: "Main fabric",
  supplier: "Reda",
  name: "Cotton",
  reference: "JKS789",
  description: "Thick cotton",
  color: "Blue denim",
  composition: "95% cotton, 5% elasthane",
  unit: "Weight",
  unit_price: "7€",
  rating: 4.5
)

componentBB = Component.create!(
  element_type: "Secondary fabric",
  supplier: "Reda",
  name: "Cotton",
  reference: "KW21",
  description: "Light fabrics",
  color: "Dark Gray",
  composition: "100% cotton",
  unit: "Length",
  unit_price: "3€",
  rating: 4
)

componentCC = Component.create!(
  element_type: "Trim",
  supplier: "YKK",
  name: "Flying",
  reference: "LM-blk",
  description: "Small zip",
  color: "Golden inox",
  composition: "Inox",
  unit: "Unit",
  unit_price: "1€",
  rating: 4
)

componentDD = Component.create!(
  element_type: "Brand trim",
  supplier: "Trim-Factory",
  name: "Show brand",
  reference: "SB651",
  description: "Small patch",
  color: "Brown",
  composition: "Leather",
  unit: "Unit",
  unit_price: "0.15€",
  rating: 4
)

TechnicalDetail.create!(
  clothe_id: clothe3.id,
  component_id: componentAA.id,
  quantity: 0.25,
)

TechnicalDetail.create!(
  clothe_id: clothe3.id,
  component_id: componentBB.id,
  quantity: 0.15,
)

TechnicalDetail.create!(
  clothe_id: clothe3.id,
  component_id: componentCC.id,
  quantity: 1,
)

TechnicalDetail.create!(
  clothe_id: clothe3.id,
  component_id: componentDD.id,
  quantity: 1,
)


# =========== Cloth example nb 4  =====

pattern4 = Pattern.create!(
  name: "Trench coat",
  description: "",
  family_id: family3.id,
)

clothe4 = Clothe.create!(
  factory_id: factory4.id,
  season_id: season1.id,
  pattern_id: pattern4.id,
  name: "Light trench coat",
  reference: "LTRC520",
  quantity: 8000,
  confection_cost: 12,
  total_cost: 96000,
  selling_price: 79
)

componentZZ = Component.create!(
  element_type: "Main fabric",
  supplier: "Reda",
  name: "Polyester",
  reference: "ERT287",
  description: "Light waterproof fabrics",
  color: "Light brown",
  composition: "95% polyester, 5% elasthane",
  unit: "Weight",
  unit_price: "7.5€",
  rating: 4
)

componentYY = Component.create!(
  element_type: "Secondary fabric",
  supplier: "Reda",
  name: "Polyester",
  reference: "TLB741",
  description: "Light fabrics",
  color: "Light Gray",
  composition: "100% polyester",
  unit: "Length",
  unit_price: "2€",
  rating: 4
)

componentXX = Component.create!(
  element_type: "Trim",
  supplier: "Reda",
  name: "Wizz",
  reference: "LB-brwn",
  description: "Trench belt",
  color: "Light brown",
  composition: "Polyester",
  unit: "Unit",
  unit_price: "2€",
  rating: 3.5
)

componentWW = Component.create!(
  element_type: "Trim",
  supplier: "Trim-Factory",
  name: "Round brown",
  reference: "BB159",
  description: "Bright large round brown plastic",
  color: "Dark Brown",
  composition: "Plastic",
  unit: "Unit",
  unit_price: "0.1€",
  rating: 4
)

componentVV = Component.create!(
  element_type: "Brand trim",
  supplier: "Trim-Factory",
  name: "Show brand lite",
  reference: "SB651",
  description: "Rectangular patch",
  color: "Brown",
  composition: "Polyester",
  unit: "Unit",
  unit_price: "0.05€",
  rating: 4
)

TechnicalDetail.create!(
  clothe_id: clothe4.id,
  component_id: componentZZ.id,
  quantity: 0.5,
)

TechnicalDetail.create!(
  clothe_id: clothe4.id,
  component_id: componentYY.id,
  quantity: 0.1,
)

TechnicalDetail.create!(
  clothe_id: clothe4.id,
  component_id: componentXX.id,
  quantity: 1,
)

TechnicalDetail.create!(
  clothe_id: clothe4.id,
  component_id: componentWW.id,
  quantity: 6,
)

TechnicalDetail.create!(
  clothe_id: clothe4.id,
  component_id: componentVV.id,
  quantity: 1,
)


# =========== Cloth example nb 5  =====

pattern5 = Pattern.create!(
  name: "Shirt",
  description: "",
  family_id: family4.id,
)

clothe5 = Clothe.create!(
  factory_id: factory5.id,
  season_id: season1.id,
  pattern_id: pattern5.id,
  name: "Summer shirt",
  reference: "LSH023",
  quantity: 10000,
  confection_cost: 7,
  total_cost: 70000,
  selling_price: 34
)

componentMM = Component.create!(
  element_type: "Main fabric",
  supplier: "Reda",
  name: "Regular cotton shirt",
  reference: "WSH580",
  description: "Elegant fabrics",
  color: "White",
  composition: "95% polyecottonster, 5% elasthane",
  unit: "Weight",
  unit_price: "5.5€",
  rating: 4.5
)

componentNN = Component.create!(
  element_type: "Trim",
  supplier: "Trim-Factory",
  name: "Elegant white button",
  reference: "WB852",
  description: "Small round white plastic",
  color: "Bright white",
  composition: "Plastic",
  unit: "Unit",
  unit_price: "0.09€",
  rating: 4
)

componentOO = Component.create!(
  element_type: "Brand trim",
  supplier: "Trim-Factory",
  name: "Show brand white",
  reference: "SBW423",
  description: "Small light rectangular patch",
  color: "White",
  composition: "Polyester",
  unit: "Unit",
  unit_price: "0.005€",
  rating: 4
)

TechnicalDetail.create!(
  clothe_id: clothe5.id,
  component_id: componentMM.id,
  quantity: 0.15,
)

TechnicalDetail.create!(
  clothe_id: clothe5.id,
  component_id: componentNN.id,
  quantity: 5,
)

TechnicalDetail.create!(
  clothe_id: clothe4.id,
  component_id: componentOO.id,
  quantity: 1,
)


