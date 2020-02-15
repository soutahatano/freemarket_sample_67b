class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string    :name         null: false
      t.reference :category     null: false, foreign_key: true
      t.string    :status       null: false, foreign_key: true, 
      t.integer   :price        null: false
      t.reference  :brand       null: false, foreign_key: true
      t.reference  :user        null: false,foreign_key: true
      t.boolien   :soldou       default: false
      t.timestamps
    end
  end
end
