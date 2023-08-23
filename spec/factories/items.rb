FactoryBot.define do
  factory :item do
    

    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10) }
    product_status_id	 { Faker::Number.between(from: 1, to: 6) }
    shipping_fee_id { Faker::Number.between(from: 1, to: 2) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    shipping_duriation_id { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/bicycle3.jpg'), filename: 'bicycle3.jpg')
    end
  end
end
