class Clothe < ApplicationRecord
  belongs_to :factory
  belongs_to :season
  belongs_to :pattern
  has_one :family, through: :pattern

  has_many :technical_details
  has_many :components, through: :technical_details


  include PgSearch::Model
  pg_search_scope :search_by_name_and_reference,
    against: [ :name, :reference],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
