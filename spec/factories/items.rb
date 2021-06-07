FactoryBot.define do
  factory :item do
    name                    { Faker::Commerce.product_name }
    explain                 { Faker::Lorem.sentence }
    category_id             { 2 }
    condition_id            { 2 }
    shipping_charge_id      { 2 }
    shipping_area_id        { 2 }
    shipping_time_id        { 2 }
    price                   { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
