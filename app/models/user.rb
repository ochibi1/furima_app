class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, :first_name, :family_name,
            :first_name_kana, :family_name_kana,
            :birth_year, :birth_month, :birth_day, presence: true
  validates :email, uniqueness: true
  validates :first_name, :family_name,
            format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, :family_name_kana,
            format: { with: /\A[ァ-ヶー－]+\z/ }
  has_one :deliver_address, dependent: :destroy
end