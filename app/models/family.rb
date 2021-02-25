class Family < ApplicationRecord
    has_many :patterns, dependent: :destroy
    has_many :factories, through: :factory_families

    validates :name, uniqueness: true, presence: true
end
