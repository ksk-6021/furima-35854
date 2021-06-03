class Item < ApplicationRecord
  belongs_to :user

  validates :name,                 presence: true
  validates :explain,              presence: true
  validates :category_id,          presence: true
  validates :condition_id,         presence: true
  validates :shipping_charge_id,   presence: true
  validates :shipping_area_id,     presence: true
  validates :shipping_time_id,     presence: true
  validates :price,                presence: true
end
