class Family < ApplicationRecord
    has_many :patterns, dependent: :destroy
end
