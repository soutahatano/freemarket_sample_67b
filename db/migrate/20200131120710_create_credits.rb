class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.string :credit_number,    null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
