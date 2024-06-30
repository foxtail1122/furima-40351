class Item < ApplicationRecord
  belongs_to :user
  has_one :item_order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :place
  belongs_to :day

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid', allow_blank: true }

  with_options presence: true do
    validates :image
    validates :title
    validates :introduction
  end

  with_options numericality: { other_than: 1, message: "を入力してください" } do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :place_id
    validates :day_id
  end
end
