class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



        with_options presence: true do
          validates :nickname, :birthday, :last_name, :first_name, :last_name_reading, :first_name_reading
          validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "must be Full-width characters"}
          validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "must be Full-width characters"}
          validates :last_name_reading, format: {with: /\A[ァ-ヶー－]+\z/, message: "must be Kana Full-width katakana characters"}
          validates :first_name_reading, format: {with: /\A[ァ-ヶー－]+\z/, message: "must be Kana Full-width katakana characters"}
          validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i , message: " is invalid. Include both letters and numbers" }
        end



end
