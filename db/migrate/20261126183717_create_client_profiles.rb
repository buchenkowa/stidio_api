class CreateClientProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :client_profiles do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.date :birth_date
      t.integer :height_cm
      t.boolean :diary_shared, null: false, default: false

      t.timestamps
    end
  end
end
