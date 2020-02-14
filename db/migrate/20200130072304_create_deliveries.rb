class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.references :user,              null: false, foreign_key: true
      t.references :item,              null: false, foreign_key: true
      t.integer :delivery_charge_id,   null: false
      t.integer :delivery_day_id,      null: false
      t.integer :prefecture_id,        null: false
      t.timestamps
    end
  end
end
