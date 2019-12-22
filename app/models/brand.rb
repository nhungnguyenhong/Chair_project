class Brand < ApplicationRecord
  belongs_to :category
  has_many :chairs
  mount_uploader :img, ImageUploader
end
