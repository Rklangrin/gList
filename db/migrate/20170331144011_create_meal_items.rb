class CreateMealItems < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_items do |t|
      t.integer :ingredient_id, null: false
      t.integer :meal_id, null: false
      t.integer :quantity, null: false
      t.string :instruction

      t.timestamps
    end
  end
end
