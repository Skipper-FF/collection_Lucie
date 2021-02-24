class Family < ApplicationRecord
    has_many :patterns, dependent: :destroy

    validates :name, uniqueness: true, presence: true
end
