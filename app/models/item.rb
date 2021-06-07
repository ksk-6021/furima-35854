class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_time

  with_options presence: true do
    validates :name
    validates :explain
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id,          numericality: { other_than: 1 }
    validates :condition_id,         numericality: { other_than: 1 }
    validates :shipping_charge_id,   numericality: { other_than: 1 }
    validates :shipping_area_id,     numericality: { other_than: 1 }
    validates :shipping_time_id,     numericality: { other_than: 1 }
  end
  

  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates_inclusion_of :price, in: 300..9_999_999, numericality: { with: VALID_PRICE_REGEX }
end
