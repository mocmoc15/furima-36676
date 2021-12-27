FactoryBot.define do
  factory :order_address do
    user_id            { 1 }
    item_id            { 1 }
    postal_code        { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    municipality       { Faker::Address.city }
    address            { Faker::Address.street_address }
    building           { Faker::Address.street_address }
    telephone_number   { Faker::Number.decimal_part(digits: 11) }
    token              { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end