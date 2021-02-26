class Season < ApplicationRecord
  belongs_to :user

  has_many :clothes
  has_one_attached :photo
end
