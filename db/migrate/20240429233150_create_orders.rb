class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string    :postal_code,    null: false
      t.integer   :prefecture_id,  null: false
      t.string    :city,           null: false
      t.string    :adress,         null: false
      t.string    :building_name
      t.string    :phone_number,   null: false
      t.references :item_order,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
