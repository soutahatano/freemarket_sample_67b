class CreateDeliveryDates < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_dates do |t|
      t.datetime :date, null: false
      t.timestamps
    end
  end
end
