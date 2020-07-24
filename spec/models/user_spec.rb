require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = create(:user)
      another_user = build(:user)
      user.valid?
    end
  end
end