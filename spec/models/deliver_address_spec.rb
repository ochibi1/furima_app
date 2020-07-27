require 'rails_helper'

describe DeliverAddress do
  describe "#create" do

    it "is valid with destination_first_name, destination_family_name, destination_first_name_kana, destination_family_name_kana, post_code, prefecture_code, city and house_number" do
      deliver_address = build(:deliver_address)
      expect(deliver_address).to be_valid
    end

    it " is invalid without destination_first_name" do
      deliver_address = build(:deliver_address, destination_first_name: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:destination_first_name]).to include("を入力してください")
    end

    it "is invalid without destination_family_name" do
      deliver_address = build(:deliver_address, destination_family_name: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:destination_family_name]).to include("を入力してください")
    end

    it "is invalid without destination_first_name_kana" do
      deliver_address = build(:deliver_address, destination_first_name_kana: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:destination_first_name_kana]).to include("を入力してください")
    end

    it "is invalid without destionation_family_name_kana" do
      deliver_address = build(:deliver_address, destination_family_name_kana: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:destination_family_name_kana]).to include("を入力してください")
    end

    it "is invalid wtihout post_code" do
      deliver_address = build(:deliver_address, post_code: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:post_code]).to include("を入力してください")
    end

    it "is invalid wihtout prefecture_code" do
      deliver_address = build(:deliver_address, prefecture_code: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:prefecture_code]).to include("を入力してください")
    end

    it "is invalid without city" do
      deliver_address = build(:deliver_address, city: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:city]).to include("を入力してください")
    end

    it "is invalid wtihout house_number" do
      deliver_address = build(:deliver_address, house_number: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:house_number]).to include("を入力してください")
    end

  end
end