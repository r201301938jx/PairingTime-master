FactoryBot.define do
  factory :pair do
    association :customer
    title {"シナモンロールとカフェラテ"}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/rspec-pair.jpg'))}
    caption {"シナモンロールとカフェラテ"}
  end
end