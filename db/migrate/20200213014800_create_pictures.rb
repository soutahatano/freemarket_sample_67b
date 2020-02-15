class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.references :item,         null: false, foreign_key: true
      t.string :picture,            null: false 
      t.timestamps
    end
  end
end
