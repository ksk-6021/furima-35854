FactoryBot.define do
  factory :item do
    
    name                    { Faker::Commerce.product_name }
    explain                 { Faker::Lorem.sentence }
    category_id             { 1 }
    condition_id            { 1 }
    shipping_charge_id      { 1 }
    shipping_area_id        { 1 }
    shipping_time_id        { 1 }
    price                   { 500 }
  end
end
