class CreateProgressEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :progress_entries do |t|
      t.references :client, null: false, foreign_key: {to_table: :users}
      t.references :author, null: false, foreign_key: {to_table: :users}
      t.date :recorded_on, null: false
      t.string :metric, null: false
      t.decimal :value, precision: 8, scale: 2, null: false
      t.text :note

      t.timestamps
    end
  end
end
