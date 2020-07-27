require 'rails_helper'

describe User do
  describe "#create" do

    it "is valid with a nickname, email, password, password_confirmation, first_name, family_name, first_name_kana, family_name_kana, birth_date" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid with an email that without proper domain" do
      user = build(:user, email: %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com foo@bar..com])
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "is valid with an email that with proper domain" do
      user = build(:user, email: %[example@example.com])
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "is invalid with a password that has less than 6 characters"do
      user = build(:user, password: "222222")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "is valid with a password that has more than 7 characters" do
      user = build(:user, password: "2222222")
      expect(user).to be_valid
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a family_name" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a family_name_kana" do 
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "is invalid without a birth_date" do
      user = build(:user, birth_date: nil)
      user.valid?
      expect(user.errors[:birth_date]).to include("を入力してください")
    end

  end
end