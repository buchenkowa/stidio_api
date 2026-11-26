class CreateFoodEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :food_entries do |t|
      t.references :client, null: false, foreign_key: {to_table: :users}
      t.datetime :recorded_at, null: false
      t.string :meal_type, null: false
      t.integer :calories
      t.integer :carbs
      t.integer :protein
      t.integer :fat
      t.text :note

      t.timestamps
    end
  end
end
