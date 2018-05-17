FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    body { Faker::Number.number(10) }
  end
end
