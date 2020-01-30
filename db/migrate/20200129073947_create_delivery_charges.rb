class CreateDeliveryCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_charges do |t|
      t.integer :price, null: false
      t.timestamps
    end
  end
end
