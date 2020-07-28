class Photo < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :products, optional: true
end
