class Pattern < ApplicationRecord
  belongs_to :family
  has_many :clothes
  
  has_one_attached :photo
end
