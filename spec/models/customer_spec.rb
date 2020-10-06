require 'rails_helper'

RSpec.describe Customer, type: :model do

  it "全ての情報があれば登録できる" do
    expect(FactoryBot.create(:customer)).to be_valid
  end

  it "氏名（姓）がなければ登録できない" do
    expect(FactoryBot.build(:customer, last_name: "")).to_not be_valid
  end

  it "氏名（名）がなければ登録できない" do
    expect(FactoryBot.build(:customer, first_name: "")).to_not be_valid
  end

  it "フリガナ（姓）がなければ登録できない" do
    expect(FactoryBot.build(:customer, last_name_kana: "")).to_not be_valid
  end

  it "フリガナ（名）がなければ登録できない" do
    expect(FactoryBot.build(:customer, first_name_kana: "")).to_not be_valid
  end

  it "電話番号がなければ登録できない" do
    expect(FactoryBot.build(:customer, phone_number: "")).to_not be_valid
  end

  it "ニックネームがなければ登録できない" do
    expect(FactoryBot.build(:customer, nickname: "")).to_not be_valid
  end

  it "メールアドレスがなければ登録できない" do
    expect(FactoryBot.build(:customer, email: "")).to_not be_valid
  end

  it "メールアドレスが重複していたら登録できない" do
    customer1 = FactoryBot.create(:customer, email: "okamoto@test.com")
    expect(FactoryBot.build(:customer, last_name: "大迫", first_name: "裕也", last_name_kana: "オオサコ", first_name_kana: "ユウヤ", phone_number: "09011112222", nickname: "ユウヤ", email: customer1.email)).to_not be_valid
  end

  it "パスワードがなければ登録できない" do
    expect(FactoryBot.build(:customer, password: "")).to_not be_valid
  end

  it "パスワードが暗号化されているか" do
    customer = FactoryBot.create(:customer)
    expect(customer.encrypted_password).to_not eq "password"
  end

end