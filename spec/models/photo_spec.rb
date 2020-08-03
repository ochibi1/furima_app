require 'rails_helper'

describe Photo do
  describe "#create" do

    it "is invalid without a product" do
      photo = build(:photo, product: "")
      photo.valid?
      expect(photo.errors[:product]).to include("を入力してください")
    end

  end
end
