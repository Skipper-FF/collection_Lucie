require "open-uri"

TechnicalDetail.destroy_all
Component.destroy_all
Clothe.destroy_all
Pattern.destroy_all
Season.destroy_all
User.destroy_all
Family.destroy_all
Factory.destroy_all


# ========= elts communs ===
fileU1 = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614790038/avatarU1_elu75q.jpg')
user1 = User.create!(
  email: "lucie@gmail.com",
  first_name: "Lucie",
  last_name: "Dupont",
  password: "lucie12345",
  )
user1.photo.attach(io: fileU1, filename: 'avatar.jpg', content_type: 'image/jpg')
user1.save!
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

# IL FAUDRA MODIF LES IMG DS CLOUDINARY
fileF1 = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614759846/pattern-pull_gd3iry.jpg')
fileF2 = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614759854/pattern-pantalon_mgqlav.jpg')
fileF3 = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614759859/pattern-manteau_edc2op.jpg')
fileF4 = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614759865/pattern-chemise_dtpgyb.jpg')
fileF5 = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614759840/pattern-tshirt2_mmsvjm.jpg')

family1 = Family.create!(
  name: "PULLS"
)
family1.photo.attach(io: fileF1, filename: 'pull.png', content_type: 'image/png')
family1.save!

family2 = Family.create!(
  name: "PANTALONS"
)
family2.photo.attach(io: fileF2, filename: 'jeans.png', content_type: 'image/png')
family2.save!

family3 = Family.create!(
  name: "MANTEAUX"
)
family3.photo.attach(io: fileF3, filename: 'manteau.png', content_type: 'image/png')
family3.save!

family4 = Family.create!(
  name: "CHEMISES"
)
family4.photo.attach(io: fileF4, filename: 'chemise.png', content_type: 'image/png')
family4.save!

family5 = Family.create!(
  name: "T-SHIRTS"
)
family5.photo.attach(io: fileF5, filename: 'tshirt.png', content_type: 'image/png')
family5.save!

factory1 = Factory.create!(
  name: "RGT Textiles",
  address: "Porto (Portugal)",
  speciality: "Chemises",
  production_capacity: 10000,
  moq: "100",
  rating: 4
)

factory2 = Factory.create!(
  name: "AAC-Textiles",
  address: "Lisbonne (Portugal)",
  speciality: "Manteaux",
  production_capacity: 7000,
  moq: "150",
  rating: 3.5
)

factory3 = Factory.create!(
  name: "BFIELD",
  address: "Łódź (Poland)",
  speciality: "Pantalons",
  production_capacity: 10000,
  moq: "1000",
  rating: 4
)

factory4 = Factory.create!(
  name: "M-Corp",
  address: "Łask (Poland)",
  speciality: "Manteaux",
  production_capacity: 5000,
  moq: "500",
  rating: 4.5
)

factory5 = Factory.create!(
  name: "Baltic SC",
  address: "Kaunas (Lithuania)",
  speciality: "Chemises",
  production_capacity: 15000,
  moq: "1000",
  rating: 4
)

factory6 = Factory.create!(
  name: "SEWPORT",
  address: "Florence (Italia)",
  speciality: "T-shirt",
  production_capacity: 20000,
  moq: "3000",
  rating: 4.5
)


factoryfamily1 = FactoryFamily.create!(
  factory_id: factory1.id,
  family_id: family4.id
)

factoryfamily2 = FactoryFamily.create!(
  factory_id: factory2.id,
  family_id: family3.id
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
  family_id: family2.id
)

factoryfamily6 = FactoryFamily.create!(
  factory_id: factory6.id,
  family_id: family5.id
)

factoryfamily7 = FactoryFamily.create!(
  factory_id: factory6.id,
  family_id: family4.id
)

factoryfamily8 = FactoryFamily.create!(
  factory_id: factory4.id,
  family_id: family5.id
)

## PATTERN 1 - T-SHIRT

pattern1 = Pattern.create!(
  name: "T-shirt poche poitrine",
  description: "T-shirt poche poitrine",
  family_id: family5.id,
)

filetshirtpoche = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614873913/t-shirt_poche_poitrine_recwid.jpg')

pattern1.photo.attach(io: filetshirtpoche, filename: 'tshirtpoche.png', content_type: 'image/png')
pattern1.save!

## PATTERN 2 - PULL

pattern2 = Pattern.create!(
  name: "Pull maille nid d'abeille",
  description: "Pull maille nid d'abeille",
  family_id: family1.id,
)

filepullabeille = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614875889/pull_nid_d_abeille_cs362i.jpg')

pattern2.photo.attach(io: filepullabeille, filename: 'pullnidabeille.png', content_type: 'image/png')
pattern2.save!

## PATTERN 3 - JEANS

pattern3 = Pattern.create!(
  name: "Jeans droit",
  description: "Jeans droit",
  family_id: family2.id,
)

filejeansdroit = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614875340/Jeans_yr7zro.jpg')

pattern3.photo.attach(io: filejeansdroit, filename: 'jeansdroit.png', content_type: 'image/png')
pattern3.save!

## PATTERN 4 - MANTEAU

pattern4 = Pattern.create!(
  name: "Manteau imperméable",
  description: "Manteau imperméable",
  family_id: family3.id,
)

fileimpermeable = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614759859/pattern-manteau_edc2op.jpg')

pattern4.photo.attach(io: fileimpermeable, filename: 'jeansdroit.png', content_type: 'image/png')
pattern4.save!

## PATTERN 5 - CHEMISE

pattern5 = Pattern.create!(
  name: "Chemise col officier",
  description: "Chemise col officier",
  family_id: family4.id,
)

filechemiseofficier = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614759865/pattern-chemise_dtpgyb.jpg')

pattern5.photo.attach(io: filechemiseofficier, filename: 'chemiseofficier.png', content_type: 'image/png')
pattern5.save!

## PATTERN 6 - T-SHIRT

pattern6 = Pattern.create!(
  name: "T-shirt col rond",
  description: "T-shirt col rond",
  family_id: family5.id,
)

filetshirtcolrond = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614873913/t-shirt_col_rond_xlrk82.jpg')

pattern6.photo.attach(io: filetshirtcolrond, filename: 'tshirtcolrond.png', content_type: 'image/png')
pattern6.save!

## PATTERN 7 - T-SHIRT

pattern7 = Pattern.create!(
  name: "T-shirt manche raglan",
  description: "T-shirt manche raglan",
  family_id: family5.id,
)

fileraglan = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614759840/pattern-tshirt2_mmsvjm.jpg')

pattern7.photo.attach(io: fileraglan, filename: 'tshirtraglan.png', content_type: 'image/png')
pattern7.save!

## PATTERN 8 - CHEMISE

pattern8 = Pattern.create!(
  name: "Chemise col francais",
  description: "Chemise col francais",
  family_id: family4.id,
)

filechemisevfrancais = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614876462/chemise_col_francais_bd9jzu.jpg')

pattern8.photo.attach(io: filechemisevfrancais, filename: 'chemisefrancais.png', content_type: 'image/png')
pattern8.save!

## PATTERN 9 - PULL

pattern9 = Pattern.create!(
  name: "Pull maille anglaises",
  description: "Pull maille anglaises",
  family_id: family1.id,
)

filepullanglaise = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614759846/pattern-pull_gd3iry.jpg')

pattern9.photo.attach(io: filepullanglaise, filename: 'pullanglaise.png', content_type: 'image/png')
pattern9.save!

## PATTERN 10 - MANTEAU

pattern10 = Pattern.create!(
  name: "Parka d'hiver",
  description: "Parka d'hiver",
  family_id: family3.id,
)

fileparka = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614876792/parka_zzf2r9.jpg')

pattern10.photo.attach(io: fileparka, filename: 'parka.png', content_type: 'image/png')
pattern10.save!

## PATTERN 11 - PANTALON

pattern11 = Pattern.create!(
  name: "Chino",
  description: "Chino",
  family_id: family2.id,
)

filechino = URI.open('https://res.cloudinary.com/dp07cstgb/image/upload/v1614759854/pattern-pantalon_mgqlav.jpg')

pattern11.photo.attach(io: filechino, filename: 'chino.png', content_type: 'image/png')
pattern11.save!

# =========== Clothe example nb 1  =====

clothe1 = Clothe.create!(
  factory_id: factory1.id,
  season_id: season1.id,
  pattern_id: pattern1.id,
  name: "T-shirt blanc",
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
  color: "Beige",
  composition: "100% cotton",
  unit: "mètre",
  unit_price: "12€",
  rating: 4,
  color_hexadecimal: "#c8ad7f",
)

component2 = Component.create!(
  element_type: "Secondary fabric",
  supplier: "Climashield",
  name: "Isolant",
  reference: "PL24",
  description: "Technical fabrics",
  color: "Gray",
  composition: "90% polyester, 10% elasthane",
  unit: "mètre",
  unit_price: "7,5€",
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
  unit: "pièce",
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
  name: "Flocage Le Wagon",
  reference: "BRD456",
  description: "Rectangular patch",
  color: "Red",
  composition: "Leather",
  unit: "pièce",
  unit_price: "3€",
  rating: 4
)

componentAZ = Component.create!(
  element_type: "Main fabric",
  supplier: "Reda",
  name: "Jersey 100% coton blanc",
  reference: "WSH580",
  description: "Jersey 100% coton blanc",
  color: "Blanc",
  composition: "79% Polyester, 21% Viscose.",
  unit: "mètre",
  unit_price: "6.9€",
  rating: 4.5,
  color_hexadecimal: "#FCFCFC"
)


TechnicalDetail.create!(
  clothe_id: clothe1.id,
  component_id: componentAZ.id,
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

clothe2 = Clothe.create!(
  factory_id: factory6.id,
  season_id: season2.id,
  pattern_id: pattern2.id,
  name: "Pull vert forêt",
  reference: "LSW1",
  quantity: 10000,
  confection_cost: 12,
  total_cost: 12,
  selling_price: 45
)

component1b = Component.create!(
  element_type: "Main fabric",
  supplier: "Reda",
  name: "Toile 100% coton sergé vert forêt",
  reference: "HWX28",
  description: "Hot and fleece cotton",
  color: "Bleu foncé",
  composition: "100% cotton",
  unit: "mètre",
  unit_price: "12€",
  rating: 4,
  color_hexadecimal: "#0C4D15"
)

component2b = Component.create!(
  element_type: "Secondary fabric",
  supplier: "Reda",
  name: "Mech noir",
  reference: "W-PL24",
  description: "Technical fabrics",
  color: "Gray",
  composition: "90% polyester, 10% elasthane",
  unit: "mètre",
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
  unit: "pièce",
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
  unit: "pièce",
  unit_price: "0.5€",
  rating: 4
)

component5b = Component.create!(
  element_type: "Brand trim",
  supplier: "Trim-Factory",
  name: "Etiquette de composition",
  reference: "BRD456",
  description: "Rectangular patch",
  color: "Black",
  composition: "Leather",
  unit: "pièce",
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

clothe3 = Clothe.create!(
  factory_id: factory3.id,
  season_id: season2.id,
  pattern_id: pattern3.id,
  name: "Jeans droit brut",
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
  color: "Denim brut",
  composition: "95% cotton, 5% elasthane",
  unit: "mètre",
  unit_price: "18€",
  rating: 4.5,
  color_hexadecimal: "#172287"

)

componentBB = Component.create!(
  element_type: "Secondary fabric",
  supplier: "Reda",
  name: "Coton noir",
  reference: "KW21",
  description: "Light fabrics",
  color: "Dark Gray",
  composition: "100% cotton",
  unit: "mètre",
  unit_price: "8€",
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
  unit: "pièce",
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
  unit: "pièce",
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


clothe4 = Clothe.create!(
  factory_id: factory4.id,
  season_id: season1.id,
  pattern_id: pattern4.id,
  name: "Manteau imperméable",
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
  color: "Noir",
  composition: "95% polyester, 5% elasthane",
  unit: "mètre",
  unit_price: "15€",
  rating: 4,
  color_hexadecimal: "#000000"
)

componentYY = Component.create!(
  element_type: "Secondary fabric",
  supplier: "Reda",
  name: "Mech blanc",
  reference: "TLB741",
  description: "Light fabrics",
  color: "Light Gray",
  composition: "100% polyester",
  unit: "mètre",
  unit_price: "3€",
  rating: 4
)

componentXX = Component.create!(
  element_type: "Trim",
  supplier: "Reda",
  name: "Zipper 20cm YKK noir",
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
  name: "Zipper 20cm YKK marine",
  reference: "BB159",
  description: "Bright large round brown plastic",
  color: "Dark Brown",
  composition: "Plastic",
  unit: "pièce",
  unit_price: "0.9€",
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
  unit: "pièce",
  unit_price: "0.25€",
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


clothe5 = Clothe.create!(
  factory_id: factory1.id,
  season_id: season1.id,
  pattern_id: pattern5.id,
  name: "Chemise col officier",
  reference: "LSH023",
  quantity: 10000,
  confection_cost: 7,
  total_cost: 7,
  selling_price: 34
)

componentMM = Component.create!(
  element_type: "Main fabric",
  supplier: "Reda",
  name: "Jersey 100% coton bleu marine",
  reference: "WSH580",
  description: "Elegant fabrics",
  color: "Bleu Marine",
  composition: "95% cotton, 5% elasthane",
  unit: "mètre",
  unit_price: "7€",
  rating: 4.5,
  color_hexadecimal: "#250C9A"
)

componentNN = Component.create!(
  element_type: "Trim",
  supplier: "Trim-Factory",
  name: "Bouton 9mm Blanc",
  reference: "WB852",
  description: "Small round white plastic",
  color: "Bright white",
  composition: "Plastic",
  unit: "pièce",
  unit_price: "0.09€",
  rating: 4
)

componentOO = Component.create!(
  element_type: "Brand trim",
  supplier: "Trim-Factory",
  name: "Label rouge Le Wagon",
  reference: "SBW423",
  description: "Small light rectangular patch",
  color: "White",
  composition: "Polyester",
  unit: "pièce",
  unit_price: "2.25€",
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


# =========== Clothe example nb 6  ====


##############################

clothe6 = Clothe.create!(
  factory_id: factory6.id,
  season_id: season1.id,
  pattern_id: pattern6.id,
  name: "Tshirt col rond",
  reference: "LSB486",
  quantity: 8000,
  confection_cost: 20,
  total_cost: 20,
  selling_price: 120
)

componentCC = Component.create!(
  element_type: "Main fabric",
  supplier: "Reda",
  name: "Jersey 100% coton noir",
  reference: "WSH580",
  description: "Elegant gray fabric",
  color: "Noir",
  composition: "79% Polyester, 21% Viscose.",
  unit: "mètre",
  unit_price: "8€",
  rating: 4.5,
  color_hexadecimal: "#000000"
)


componentDD = Component.create!(
  element_type: "Trim",
  supplier: "Trim-Factory",
  name: "Bouton Gris 9mm",
  reference: "DGB951",
  description: "Medium-sized round dark grey plastic",
  color: "Dark gray",
  composition: "Plastic",
  unit: "pièce",
  unit_price: "0.15€",
  rating: 4
)

componentEE = Component.create!(
  element_type: "Brand trim",
  supplier: "Trim-Factory",
  name: "Broderie le Wagon",
  reference: "SBG426",
  description: "Small rectangular patch",
  color: "Gray",
  composition: "Polyester",
  unit: "pièce",
  unit_price: "4.25€",
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
