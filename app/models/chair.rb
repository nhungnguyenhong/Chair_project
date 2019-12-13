class Chair < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :img, presence: true

  has_many :order_items
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  has_many :ratings
  mount_uploader :img, ImageUploader

  # default_scope { where(active: true) }
end
