class Season < ApplicationRecord
  belongs_to :users

  has_many :clothes
end
