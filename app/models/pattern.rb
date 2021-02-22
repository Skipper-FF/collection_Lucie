class Pattern < ApplicationRecord
  belongs_to :family

  has_many :clothes
end
