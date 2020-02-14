class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.references :user,              null: false, foreign_key: true
      t.references :item,              null: false, foreign_key: true
      t.string :delivery_charge,       null: false 
      t.string :delivery_day,          null: false 
      t.integer :prefecture_id,        null: false
      t.timestamps
    end
  end
end
