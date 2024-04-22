class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title,           null: false
      t.text :introduction,      null: false
      t.integer :category_id,    null: false
      t.integer :condition_id,   null: false
      t.integer :fee_id,         null: false
      t.integer :place_id,       null: false
      t.integer :day_id,         null: false
      t.integer :place,          null: false
      t.references :user,        null: false, foreign_key: true

      t.timestamps
    end
  end
end