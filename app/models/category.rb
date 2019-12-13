class Category < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    has_many :chairs
    has_many :brands
end
