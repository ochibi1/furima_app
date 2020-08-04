require 'rails_helper'

describe Photo do
  describe "#build" do

    it "is valid with a product" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "is invalid without a product" do
      photo = build(:photo, product: nil)
      photo.valid?
      expect(photo.errors[:product]).to include("を入力してください")
    end

    let(:image_path) { Rails.root.join('spec/factories/test.png') }
    let(:image) { Rack::Test::UploadedFile.new(image_path) }
  
    it "is invalid without photo" do
      photo = build(:photo, image: nil)
      photo.valid?
      expect(photo.errors[:image]).to include("を入力してください")
    end
  
    it "is valid with photo" do
      photo = build(:photo)
      expect(photo).to be_valid
    end

    it "is valid with 2 photos" do
      photo = build(:photo, image: [image, image])
      expect(photo).to be_valid
    end

    it "is valid with 10 photos" do
      photo = build(:photo, image: [image, image, image, image, image, image, image, image, image, image, ])
      expect(photo).to be_valid
    end

    it "is invalid a photo that has more than 11 photo" do
      photo = build(:photo, image: [image, image, image, image, image, image, image, image, image, image,image,])
      photo.valid?
      expect(photo.errors[:image]).to include("は10枚以内で入力してください")
    end
  end
end
