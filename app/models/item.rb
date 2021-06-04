class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_time
  

  validates :name,                 presence: true
  validates :explain,              presence: true
  validates :category_id,          numericality: { other_than: 1 }
  validates :condition_id,         numericality: { other_than: 1 }
  validates :shipping_charge_id,   numericality: { other_than: 1 }
  validates :shipping_area_id,     numericality: { other_than: 1 }
  validates :shipping_time_id,     numericality: { other_than: 1 }
  validates :price,                numericality: { other_than: 1 }
  validates :image,                presence: true
end
