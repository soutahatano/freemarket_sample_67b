class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,               null: false, index: true
      t.string :text,               null:false
      t.string :soldout,            null: false, default: "false"
      t.string :brand
      t.integer :price,             null: false
      t.integer :status_id,         null: false
      t.references :category,       null: false, foreign_key: true
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
