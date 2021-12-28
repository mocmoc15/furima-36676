FactoryBot.define do
  factory :item do
    item_name              {Faker::Commerce.product_name}
    explanation            {Faker::Lorem.sentence}
    category_id            {2}
    status_id              {2}
    prefecture_id          {2}
    shipping_cost_id       {2}
    time_to_ship_id        {2}
    price                  {5000}

    association :user 

    trait :image do
      after(:build) do |item|
        File.open("#{Rails.root}/spec/images/Unknown.jpeg") do |f|
          item.images.attach(io: f, filename: "Unknown.jpeg", content_type: 'image/jpeg')
        end
      end
    end
  end
end