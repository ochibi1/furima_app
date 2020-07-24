require 'rails_helper'

describe User do
  describe "#create" do

    it "is valid with nickname, email, password, password_confirmation, first_name, family_name, first_name_kana, family_name_kana, birth_year, birth_month and birth_day" do
      user = build(:user)
      expect(user).to be_valid
    end

    # it "is invalid without a nickname" do
    #   user = build(:user, nickname: nil)
    #   expect(user.errors[:nickname]).to include("can't be blank")
    # end

    # it "is invalid without an email" do
    #   user = build(:user, email: nil)
    #   expect(user.errors[:email]).to include("can't be blank")
    # end

    # it "is invalid with a duplicate email" do
    #   user = create(:user)
    #   another_user = build(:user, email: user.com)
    #   another_user.valid?
    #   expect(another_user.errors[:email]).to include("has already been taken")
    # end

    # it "is invalid without a password" do
    #   user = build(:user, password: nil)
    #   user.valid?
    #   expect(user.errors[:password]).to include("can't be blank")
    # end

    # it "is invalid without a password_confirmation" do
    #   user = build(:user, password_confirmation: "")
    #   user.valid?
    #   expect(user.errors[:password_confirmation]).to include("doesn't match password")
    # end

    # it "is invalid with a password that has less than 6 characters"do
    #   user = build(:user, password: "222222")
    #   user.valid?
    #   expect(user.errors[:password]).to include("is too short(minimum is 7 characters")
    # end

    # it "is valid with a password that has more than 7 characters" do
    #   user = build(:user, password: "2222222")
    #   expect(user).to be_valid
    # end

    # it "is invalid without a first_name" do
    #   user = build(:user, first_name: nil)
    #   expect(user.errors).to include("can't be blank")
    # end

    # it "is invalid without a family_name" do
    #   user = build(:user, family_name: nil)
    #   expect(user.errors).to include("can't be blank")
    # end

    # it "is invalid without a first_name_kana" do
    #   user = build(:user, first_name_kana: nil)
    #   expect(user.errors).to include("can't be blank")
    # end

    # it "is invalid without a family_name_kana" do 
    #   user = build(:user, family_name_kana: nil)
    #   expect(user.errors).to include("can't be blank")
    # end

    # it "is invalid without a birth_year" do
    #   user = build(:user, birth_year: nil)
    #   expect(user.errors).to include("can't be blank")
    # end

    # it "is invalid without a birth_month" do
    #   user = build(:user, birth_month: nil)
    #   expect(user.errors).to include("can't be blank")
    # end

    # it "is invalid wihtout a birth_day" do
    #   user = build(:user, birth_day: nil)
    #   expect(user.errors).to include("can't be blank")
    # end

  end
end