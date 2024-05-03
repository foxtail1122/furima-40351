class ItemOrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :adress, :building_name, :phone_number, :token

  with_options presence: true do
    # item_orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # orderモデルのバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)', allow_blank: true }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :adress
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid', allow_blank: true }
    # トークンのバリデーション
    validates :token
  end

  def save
    item_order = ItemOrder.create(user_id:, item_id:)
    # ストロングパラメーターでデータが運ばれ、それらが保存のタイミングで「order_id」が生成され、保存される。
    Order.create(item_order_id: item_order.id, postal_code:, prefecture_id:, city:,
                 adress:, building_name:, phone_number:)
  end
end
