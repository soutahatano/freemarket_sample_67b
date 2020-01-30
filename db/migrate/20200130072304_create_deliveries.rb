class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.references :user,              null: false, foreign_key: true
      t.references :item,              null: false, foreign_key: true
      t.references :delivery_charge,   null: false, foreign_key: true
      t.references :delivery_day,      null: false, foreign_key: true
      t.references :delivery_way,      null: false, foreign_key: true
      t.references :delivery_date,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
