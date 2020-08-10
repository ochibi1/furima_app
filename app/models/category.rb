class Category < ApplicationRecord
  validates :name, presence: true
  has_many :products, dependent: :destroy
  has_ancestry

  def self.set_parents
    Category.where(ancestry: nil).order(id: "ASC")
  end
end