require 'rails_helper'

RSpec.describe Pair, type: :model do

  it "全ての情報があれば登録できる" do
    expect(FactoryBot.create(:pair)).to be_valid
  end

  it "タイトルがなければ登録できない" do
    expect(FactoryBot.build(:pair, title: "")).to_not be_valid
  end

  it "画像がなければ登録できない" do
    expect(FactoryBot.build(:pair, image: nil)).to_not be_valid
  end

end