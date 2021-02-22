class Clothe < ApplicationRecord
  belongs_to :factory
  belongs_to :season
  belongs_to :pattern
end
