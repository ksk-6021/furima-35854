class User < ApplicationRecord
  has_many :items
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/.freeze
  with_options presence: true, format: { with: ZENKAKU_REGEX, message: 'is invalid. Input full-width characters' } do
    validates :last_name
    validates :first_name
  end

  KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  with_options presence: true, format: { with: KANA_REGEX, message: 'is invalid. Input full-width katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :birth_date, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX,
                                 message: 'is invalid. Include both letters and numbers' }
end
