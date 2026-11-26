class RemoveStartAtFromTrainings < ActiveRecord::Migration[7.2]
  def change
    remove_column :trainings, :start_at, :datetime
  end
end
