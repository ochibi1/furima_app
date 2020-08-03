require 'rails_helper'
describe Product do

  describe "#create" do
    it "is valid with a name ,introduction,size ,barnd ,condition ,postage_payer ,prefecture_code ,prep_date ,price ,trading_status ,closed_deal_date ,seller ,buyer" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "is invalid without a name" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a introduction" do
      product = build(:product, introduction: "")
      product.valid?
      expect(product.errors[:introduction]).to include("を入力してください")
    end

    it "is invalid without a size" do
      product = build(:product, size: "")
      product.valid?
      expect(product.errors[:size]).to include("を入力してください")
    end

    it "is invalid without a condition" do
      product = build(:product, condition: "")
      product.valid?
      expect(product.errors[:condition]).to include("を入力してください")
    end
  
    it "is invalid without a postage_payer" do
      product = build(:product, postage_payer: "")
      product.valid?
      expect(product.errors[:postage_payer]).to include("を入力してください")
    end

    it "is invalid without a prefecture_code" do
      product = build(:product, prefecture_code: "")
      product.valid?
      expect(product.errors[:prefecture_code]).to include("を入力してください")
    end

    it "is invalid without a prep_date" do
      product = build(:product, prep_date: "")
      product.valid?
      expect(product.errors[:prep_date]).to include("を入力してください")
    end

    it "is invalid without a price" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end


    it "is invalid without a trading_status" do
      product = build(:product, trading_status: "")
      product.valid?
      expect(product.errors[:trading_status]).to include("を入力してください")
    end


    it "is invalid without a closed_deal_date" do
      product = build(:product, closed_deal_date: "")
      product.valid?
      expect(product.errors[:closed_deal_date]).to include("を入力してください")
    end


    it "is invalid without a seller" do
      product = build(:product, seller: "")
      product.valid?
      expect(product.errors[:seller]).to include("を入力してください")
    end


    it "is invalid without a buyer" do
      product = build(:product, buyer: "")
      product.valid?
      expect(product.errors[:buyer]).to include("を入力してください")
    end
  end

  describe "#update" do
    it "is valid with a name ,introduction,size ,barnd ,condition ,postage_payer ,prefecture_code ,prep_date ,price ,trading_status ,closed_deal_date ,seller ,buyer" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "is invalid without a name" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a introduction" do
      product = build(:product, introduction: "")
      product.valid?
      expect(product.errors[:introduction]).to include("を入力してください")
    end

    it "is invalid without a size" do
      product = build(:product, size: "")
      product.valid?
      expect(product.errors[:size]).to include("を入力してください")
    end

    it "is invalid without a condition" do
      product = build(:product, condition: "")
      product.valid?
      expect(product.errors[:condition]).to include("を入力してください")
    end
  
    it "is invalid without a postage_payer" do
      product = build(:product, postage_payer: "")
      product.valid?
      expect(product.errors[:postage_payer]).to include("を入力してください")
    end

    it "is invalid without a prefecture_code" do
      product = build(:product, prefecture_code: "")
      product.valid?
      expect(product.errors[:prefecture_code]).to include("を入力してください")
    end

    it "is invalid without a prep_date" do
      product = build(:product, prep_date: "")
      product.valid?
      expect(product.errors[:prep_date]).to include("を入力してください")
    end

    it "is invalid without a price" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end


    it "is invalid without a trading_status" do
      product = build(:product, trading_status: "")
      product.valid?
      expect(product.errors[:trading_status]).to include("を入力してください")
    end


    it "is invalid without a closed_deal_date" do
      product = build(:product, closed_deal_date: "")
      product.valid?
      expect(product.errors[:closed_deal_date]).to include("を入力してください")
    end


    it "is invalid without a seller" do
      product = build(:product, seller: "")
      product.valid?
      expect(product.errors[:seller]).to include("を入力してください")
    end


    it "is invalid without a buyer" do
      product = build(:product, buyer: "")
      product.valid?
      expect(product.errors[:buyer]).to include("を入力してください")
    end
  end


end
