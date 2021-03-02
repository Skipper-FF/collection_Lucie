require "open-uri"

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
Season.destroy_all
User.destroy_all
Family.destroy_all
Factory.destroy_all


# ========= elts communs ===

user1 = User.create!(
  email: "jean@gmail.com",
  password: "jean12345",
  )
  p user1


file = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614333978/COLLECTION-APP%20IMAGES/SS21_ap54ss.jpg')
file2 = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614334437/COLLECTION-APP%20IMAGES/AW21_wwalor.jpg')

season1 = Season.new(
  name: "Spring Summer 2021",
  beginning_date: Date.new(2021,02,01),
  ending_date: Date.new(2021,06,30)
)
season1.photo.attach(io: file, filename: 'spring.png', content_type: 'image/png')
season1.user = user1
season1.save!
p season1


season2 = Season.new(
  name: "Autumn Winter 2021",
  beginning_date: Date.new(2021,07,01),
  ending_date: Date.new(2022,01,01)
)
season2.photo.attach(io: file2, filename: 'autumn.png', content_type: 'image/png')
season2.user = user1
season2.save!
p season2


fileF1 = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614693043/sweatshirt_zrvx0j.jpg')
fileF2 = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614692608/DESSIN-MCA104-CHINO_SLIN_PANT-DEVANT_1_f8ywc8.jpg')
fileF3 = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614693165/coat_female_tqblnz.jpg')
fileF4 = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614693272/shirts_h7ce9k.jpg')
fileF5 = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614693375/blazers_v0kpkg.jpg')

family1 = Family.create!(
  name: "SWEATS"
)
family1.photo.attach(io: fileF1, filename: 'sweats.png', content_type: 'image/png')
family1.save!


family2 = Family.create!(
  name: "JEANS"
)
family2.photo.attach(io: fileF2, filename: 'jeans.png', content_type: 'image/png')
family2.save!

family3 = Family.create!(
  name: "COATS"
)
family3.photo.attach(io: fileF3, filename: 'coats.png', content_type: 'image/png')
family3.save!

family4 = Family.create!(
  name: "SHIRTS"
)
family4.photo.attach(io: fileF4, filename: 'shirts.png', content_type: 'image/png')
family4.save!

family5 = Family.create!(
  name: "BLAZERS"
)
family5.photo.attach(io: fileF5, filename: 'blazers.png', content_type: 'image/png')
family5.save!

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

factory6 = Factory.create!(
  name: "SEWPORT",
  address: "Florence (Italia)",
  speciality: "Blazers, Suits",
  production_capacity: 20000,
  moq: "3000",
  rating: 4.5
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

factoryfamily6 = FactoryFamily.create!(
  factory_id: factory6.id,
  family_id: family5.id
)

# =========== Clothe example nb 1  =====

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
  total_cost: 7,
  selling_price: 34
)

component1 = Component.create!(
  element_type: "Main fabric",
  supplier: "Reda",
  name: "Toile 100% coton sergé beige",
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
  name: "Zipper 15cm metal",
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
  name: "Cordlock",
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
  name: "Zip 10cm nylon",
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


# =========== Clothe example nb 2 =====

pattern2 = Pattern.create!(
  name: "Longsleeve sweatshirt",
  description: "",
  family_id: family1.id,
)


clothe2 = Clothe.create!(
  factory_id: factory2.id,
  season_id: season2.id,
  pattern_id: pattern2.id,
  name: "Hot sweatshirt",
  reference: "LSW1",
  quantity: 10000,
  confection_cost: 12,
  total_cost: 12,
  selling_price: 45
)

component1b = Component.create!(
  element_type: "Main fabric",
  supplier: "Reda",
  name: "Toile 100% coton sergé bleu",
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
  name: "Mech noir",
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
  name: "Zip 15cm metal black",
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
  name: "Button 9mm",
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
  name: "Button 11mm black",
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


# =========== Clothe example nb 3  =====

pattern3 = Pattern.create!(
  name: "Regular jeans",
  description: "",
  family_id: family2.id,
)

clothe3 = Clothe.create!(
  factory_id: factory3.id,
  season_id: season2.id,
  pattern_id: pattern3.id,
  name: "Hot jeans",
  reference: "RJ430",
  quantity: 15000,
  confection_cost: 9,
  total_cost: 9,
  selling_price: 35
)


componentAA = Component.create!(
  element_type: "Main fabric",
  supplier: "Reda",
  name: "Toile denim 100% coton selvedge 14oz brute",
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
  name: "Coton noir",
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
  name: "Zipper 15cm taupe",
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
  name: "Etiquette taille",
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


# =========== Clothe example nb 4  =====

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
  total_cost: 12,
  selling_price: 79
)

componentZZ = Component.create!(
  element_type: "Main fabric",
  supplier: "Reda",
  name: "Toile denim 100% coton selvedge 14oz noire",
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
  name: "Etiquette marque",
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


# =========== Clothe example nb 5  =====

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
  total_cost: 7,
  selling_price: 34
)

componentMM = Component.create!(
  element_type: "Main fabric",
  supplier: "Reda",
  name: "Jersey 100% mérinos rayé bleu/blanc",
  reference: "WSH580",
  description: "Elegant fabrics",
  color: "White",
  composition: "95% cotton, 5% elasthane",
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


# =========== Clothe example nb 6  =====

pattern6 = Pattern.create!(
  name: "Summer Blazer",
  description: "",
  family_id: family5.id,
)

clothe6 = Clothe.create!(
  factory_id: factory6.id,
  season_id: season1.id,
  pattern_id: pattern6.id,
  name: "Elegant blazer",
  reference: "LSB486",
  quantity: 8000,
  confection_cost: 20,
  total_cost: 20,
  selling_price: 120
)

componentCC = Component.create!(
  element_type: "Main fabric",
  supplier: "Reda",
  name: "Toile Komatsu 100% polyester déperlante",
  reference: "WSH580",
  description: "Elegant gray fabric",
  color: "Light gray",
  composition: "79% Polyester, 21% Viscose.",
  unit: "Weight",
  unit_price: "6€",
  rating: 4.5
)

componentDD = Component.create!(
  element_type: "Trim",
  supplier: "Trim-Factory",
  name: "Elegant dark gray button",
  reference: "DGB951",
  description: "Medium-sized round dark grey plastic",
  color: "Dark gray",
  composition: "Plastic",
  unit: "Unit",
  unit_price: "0.05€",
  rating: 4
)

componentEE = Component.create!(
  element_type: "Brand trim",
  supplier: "Trim-Factory",
  name: "Show brand gray",
  reference: "SBG426",
  description: "Small rectangular patch",
  color: "Gray",
  composition: "Polyester",
  unit: "Unit",
  unit_price: "0.005€",
  rating: 4
)

TechnicalDetail.create!(
  clothe_id: clothe6.id,
  component_id: componentCC.id,
  quantity: 0.25,
)

TechnicalDetail.create!(
  clothe_id: clothe6.id,
  component_id: componentDD.id,
  quantity: 2,
)

TechnicalDetail.create!(
  clothe_id: clothe6.id,
  component_id: componentEE.id,
  quantity: 1,
)
