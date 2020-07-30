require 'rails_helper'

describe DeliverAddress do
  describe "#create" do

    it "is valid with destination_first_name, destination_family_name, destination_first_name_kana, destination_family_name_kana, post_code, prefecture_code, city and house_number" do
      deliver_address = build(:deliver_address)
      expect(deliver_address).to be_valid
    end

    it " is invalid without destination_first_name" do
      deliver_address = build(:deliver_address, destination_first_name: "")
      deliver_address.valid?
      expect(deliver_address.errors[:destination_first_name]).to include("を入力してください")
    end

    it "is invalid without destination_family_name" do
      deliver_address = build(:deliver_address, destination_family_name: "")
      deliver_address.valid?
      expect(deliver_address.errors[:destination_family_name]).to include("を入力してください")
    end

    it "is invalid without destination_first_name_kana" do
      deliver_address = build(:deliver_address, destination_first_name_kana: "")
      deliver_address.valid?
      expect(deliver_address.errors[:destination_first_name_kana]).to include("を入力してください")
    end

    it "is invalid without destionation_family_name_kana" do
      deliver_address = build(:deliver_address, destination_family_name_kana: "")
      deliver_address.valid?
      expect(deliver_address.errors[:destination_family_name_kana]).to include("を入力してください")
    end

    it "is invalid wtihout post_code" do
      deliver_address = build(:deliver_address, post_code: "")
      deliver_address.valid?
      expect(deliver_address.errors[:post_code]).to include("を入力してください")
    end

    it "is invalid wihtout prefecture_code" do
      deliver_address = build(:deliver_address, prefecture_code: "")
      deliver_address.valid?
      expect(deliver_address.errors[:prefecture_code]).to include("を入力してください")
    end

    it "is invalid without city" do
      deliver_address = build(:deliver_address, city: "")
      deliver_address.valid?
      expect(deliver_address.errors[:city]).to include("を入力してください")
    end

    it "is invalid wtihout house_number" do
      deliver_address = build(:deliver_address, house_number: "")
      deliver_address.valid?
      expect(deliver_address.errors[:house_number]).to include("を入力してください")
    end

    it "is valid with phone_number that has 11 numbers" do
      deliver_address = build(:deliver_address, phone_number: "09012345678")
      expect(deliver_address).to be_valid
    end

    it "is valid with phone_number that has 10 numbers" do
      deliver_address = build(:deliver_address, phone_number: "0987654321")
      expect(deliver_address).to be_valid
    end

    it "is invalid with phone_number that has less than 9 numbers" do
      deliver_address = build(:deliver_address, phone_number: "098765432")
      deliver_address.valid?
      expect(deliver_address.errors[:phone_number]).to include("は不正な値です")
    end

    it "is invalid with phone_number that has more than 12 numbers" do
      deliver_address = build(:deliver_address, phone_number: "009012345678")
      deliver_address.valid?
      expect(deliver_address.errors[:phone_number]).to include("は不正な値です")
    end

  end
end