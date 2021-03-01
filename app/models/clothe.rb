class Clothe < ApplicationRecord
  belongs_to :factory
  belongs_to :season
  belongs_to :pattern
  has_one :family, through: :pattern

  has_many :technical_details
  accepts_nested_attributes_for :technical_details ## Important pour le formulaire de création de clothes. Permet de nester le fomulaire de création de technical_details
  has_many :components, through: :technical_details

  include PgSearch::Model
  pg_search_scope :search_by_name_and_reference,
    against: [ :name, :reference],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  # private
  # calcul du coût de revient total du vêtement en fctn des quantités à produire
  def total_production_cost
    total_cost * quantity
  end

  # calcul du C.A. total du vêtement en fctn des quantités produites
  def turnover
    selling_price * quantity
  end

  # calcul du taux de marge unitaire du vêtement 
  # ATTN ICI LE CALCUL N EST PAS SUR LE H.T.
  def margin_rate
    margin = selling_price - total_cost
    margin_rate = ( margin / total_cost ).to_f
  end

end

