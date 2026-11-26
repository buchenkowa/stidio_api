class CreateTrainerClients < ActiveRecord::Migration[7.2]
  def change
    create_table :trainer_clients do |t|
      t.references :trainer, null: false, foreign_key: {to_table: :users}
      t.references :client, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
    add_index :trainer_clients, [:trainer_id, :client_id],  unique: true
  end
end
