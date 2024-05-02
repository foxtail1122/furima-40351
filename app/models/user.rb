class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :item_orders


  with_options presence: true do
    validates :nickname, :birthday
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'must be Full-width characters', allow_blank: true }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'must be Full-width characters', allow_blank: true }
    validates :last_name_reading,
              format: { with: /\A[ァ-ヶー－]+\z/, message: 'must be Kana Full-width katakana characters', allow_blank: true }
    validates :first_name_reading,
              format: { with: /\A[ァ-ヶー－]+\z/, message: 'must be Kana Full-width katakana characters', allow_blank: true }
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: ' is invalid. Include both letters and numbers',
                        allow_blank: true }
  end
end
