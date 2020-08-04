require 'rails_helper'

describe Category do
  describe "#create" do

    it "is invalid without a name" do
      category = build(:category, name: "")
      category.valid?
      expect(category.errors[:name]).to include("を入力してください")
    end

  end
end
