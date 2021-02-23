class Season < ApplicationRecord
  belongs_to :user

  has_many :clothes
end
