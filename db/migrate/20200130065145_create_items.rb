class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,               null: false, index: true
      t.string :text,               null:false
      t.integer :price,             null: false
      t.references :category,       null: false, foreign_key: true
      t.string :status,         null: false, foreign_key: true
      t.references :brand,          null: false, foreign_key: true
      t.references :user,           null: false, foreign_key: true
      t.boolean :soldout,           null: false, default: "false"
      t.timestamps
    end
  end
end
