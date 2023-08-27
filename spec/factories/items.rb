FactoryBot.define do
  factory :item do
    association :user, factory: :user
      name {'Product'}
      description {'asdfaga'}
      category_id { 2 }
      product_status_id { 2 }
      shipping_fee_id { 2 }
      prefecture_id { 2 }
      shipping_duriation_id { 2 }
      price { 300 }
    

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/pexels-photo-1301976.webp'), filename: 'pexels-photo-1301976.webp')
      end
  
  end
end
