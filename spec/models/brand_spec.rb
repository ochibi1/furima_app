require 'rails_helper'
describe Brand do
  describe "#create" do
    it "is valid with a name" do
      brand = build(:brand)
      expect(brand).to be_valid
    end
  end
end