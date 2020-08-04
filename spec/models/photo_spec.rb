require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe "#create" do

    it "is invalid without a product" do
      photo = build(:photo, product_id: nil)
      photo.valid?
      # expect(photo.errors[:product]).to include("を入力してください")
    end

  end
end
