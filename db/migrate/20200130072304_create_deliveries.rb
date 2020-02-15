class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.references :user,              foreign_key: true
      t.references :item,              null: false, foreign_key: true
      t.integer :deliverycharge_id,   null: false
      t.integer :deliveryday_id,      null: false
      t.integer :prefecture_id,        null: false
      t.timestamps
    end
  end
end
