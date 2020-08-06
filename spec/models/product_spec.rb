require 'rails_helper'
describe Product do

  describe "#create" do
    it "is valid with a name, introduction,size_id, condition_id, postage_payer_id, prefecture_code, prep_date_id, price, trading_status, seller_id " do
      product = build(:product)
      expect(product).to be_valid
    end

    it "is invalid without a name" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include( "を入力してください" )
    end

    it "is invalid without a introduction" do
      product = build(:product, introduction: "")
      product.valid?
      expect(product.errors[:introduction]).to include("を入力してください")
    end

    it "is invalid without a size" do
      product = build(:product, size_id: "")
      product.valid?
      expect(product.errors[:size_id]).to include("を入力してください")
    end

    it "is invalid without a condition" do
      product = build(:product, condition_id: "")
      product.valid?
      expect(product.errors[:condition_id]).to include("を入力してください")
    end
  
    it "is invalid without a postage_payer" do
      product = build(:product, postage_payer_id: "")
      product.valid?
      expect(product.errors[:postage_payer_id]).to include("を入力してください")
    end

    it "is invalid without a prefecture_code" do
      product = build(:product, prefecture_code: "")
      product.valid?
      expect(product.errors[:prefecture_code]).to include("を入力してください")
    end

    it "is invalid without a prep_date" do
      product = build(:product, prep_date_id: "")
      product.valid?
      expect(product.errors[:prep_date_id]).to include("を入力してください")
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

    it "is invalid without a seller" do
      product = build(:product, seller_id: "")
      product.valid?
      expect(product.errors[:seller_id]).to include("を入力してください")
    end


    it " is valid with a introduction that has less than 1000 characters" do
      product = build(:product, introduction: "a"*1000 )
      expect(product).to be_valid
    end

    it " is invalid with a introduction that has more than 1001characters" do
      product = build(:product, introduction: "a"*1001 )
      product.valid?
      expect(product.errors[:introduction]).to include("は1000文字以内で入力してください")
    end
  
    it " is valid with a name that has less than 40 characters" do
      product = build(:product, name: "a"*40)
      expect(product).to be_valid
    end

    it " is invalid with a name that has more than 41characters" do
      product = build(:product, name: "a"*42 )
      product.valid?
      expect(product.errors[:name]).to include("は40文字以内で入力してください")
    end
 
    it "is invalid with a price that has less than 299characters " do
      product = build(:product, price: 299)
      product.valid?
      expect(product.errors[:price]).to include("は300以上の値にしてください")
    end
    
    it "is invalid with price that has more than 9999999characters " do
      product = build(:product, price: 99999999)
      product.valid?
      expect(product.errors[:price]).to include("は9999999以下の値にしてください")
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
      product = build(:product, size_id: "")
      product.valid?
      expect(product.errors[:size_id]).to include("を入力してください")
    end

    it "is invalid without a condition" do
      product = build(:product, condition_id: "")
      product.valid?
      expect(product.errors[:condition_id]).to include("を入力してください")
    end
  
    it "is invalid without a postage_payer" do
      product = build(:product, postage_payer_id: "")
      product.valid?
      expect(product.errors[:postage_payer_id]).to include("を入力してください")
    end

    it "is invalid without a prefecture_code" do
      product = build(:product, prefecture_code: "")
      product.valid?
      expect(product.errors[:prefecture_code]).to include("を入力してください")
    end

    it "is invalid without a prep_date" do
      product = build(:product, prep_date_id: "")
      product.valid?
      expect(product.errors[:prep_date_id]).to include("を入力してください")
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



    it "is invalid without a seller" do
      product = build(:product, seller_id: "")
      product.valid?
      expect(product.errors[:seller_id]).to include("を入力してください")
    end



  end


end
