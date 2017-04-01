class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.date :date

      t.timestamps
    end
  end
end
