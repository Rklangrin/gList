class CreateListMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :list_meals do |t|
      t.integer :list_id, null: false
      t.integer :meal_id, null: false

      t.timestamps
    end
  end
end
