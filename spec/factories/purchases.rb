FactoryBot.define do
  factory :purchase do
    postal_code    { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    prefecture_id  { Faker::Number.within(range: 2..48) }
    city do
      cities = %w[釜石市 徳島市 世田谷区]
      cities.sample
    end
    house_number   { Faker::Address.street_address }
    building_name  { Faker::Company.name }
    phone_number   { Faker::Number.leading_zero_number(digits: 11) }
  end
end
