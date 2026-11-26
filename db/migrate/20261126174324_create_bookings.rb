class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.references :client, null: false, foreign_key: {to_table: :users}
      t.references :training, null: false, foreign_key: {to_table: :trainings}
      t.string :status, null: false, default: 'booked'

      t.timestamps
    end
    add_index :bookings,        [:client_id, :training_id], unique: true  
  end
end
