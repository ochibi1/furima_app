class DeliverAddress < ApplicationRecord
  validates :post_code, :prefectuer_code, :city,
            :house_number, :user, :destination_first_name,
            :destination_family_name, :destination_first_name_kana,
            :destination_family_name_kana, presence: true
  validates :phone_number,                 unique: true
  validates :phone_number, format: { with: /\A\d+-\d+-\d+\z/ }
  validates :destination_first_name_kana, :destination_family_name_kana,
                           format: { with: /\A[ァ-ヶー－]+\z/ }
  belongs_to :user
end
