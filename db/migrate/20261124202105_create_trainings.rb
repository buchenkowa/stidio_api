class CreateTrainings < ActiveRecord::Migration[7.2]
  def change
    create_table :trainings do |t|
      t.references :trainer, null: false, foreign_key: {to_table: :users}
      t.string :title, null: false
      t.datetime :start_at
      t.integer :duration_minutes
      t.integer :capacity, null: false
      t.datetime :cancelled_at
      t.datetime :starts_at, null: false

      t.timestamps
    end
  end
end
