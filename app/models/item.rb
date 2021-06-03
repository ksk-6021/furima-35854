class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shiping_time
  has_one_attached :image

  validates :name,                 presence: true
  validates :explain,              presence: true
  validates :category_id,          numericality: { other_than: 1 }
  validates :condition_id,         numericality: { other_than: 1 }
  validates :shipping_charge_id,   numericality: { other_than: 1 }
  validates :shipping_area_id,     numericality: { other_than: 1 }
  validates :shipping_time_id,     numericality: { other_than: 1 }
  validates :price,                numericality: { other_than: 1 }
end
