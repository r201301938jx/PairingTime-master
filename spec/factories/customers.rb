FactoryBot.define do
  factory :customer do
    last_name {"岡本"}
    first_name {"和馬"}
    last_name_kana {"オカモト"}
    first_name_kana {"カズマ"}
    phone_number {"09011112222"}
    nickname {"カズマン"}
    email {"okamoto@test.com"}
    password {"password"}
    password_confirmation {"password"}
  end
end
