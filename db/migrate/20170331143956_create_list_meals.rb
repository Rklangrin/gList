class CreateListMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :list_meals do |t|

      t.timestamps
    end
  end
end
