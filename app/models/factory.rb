class Factory < ApplicationRecord
    has_many :clothes

    validates :name, uniqueness: true, presence: true
    validates :production_capacity, numericality: {greater_than: 0}
end
