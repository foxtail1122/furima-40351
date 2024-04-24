class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :place
  belongs_to :day

  with_options presence: true do

    validates :image
    validates :title
    validates :introduction
    validates :price
  end

  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  validates :category_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :condition_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :fee_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :place_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :day_id, numericality: {other_than: 1, message: "can't be blank"}

end
