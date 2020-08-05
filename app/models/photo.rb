class Photo < ApplicationRecord
  validates :image, presence: true
  validates :product, presence: true
  mount_uploader :images, ImageUploader
  belongs_to :product, optional: true
end