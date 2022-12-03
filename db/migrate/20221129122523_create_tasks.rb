class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :task
      t.integer :assigned_to_id
      t.integer :assigned_by_id

      t.timestamps
    end
  end
end
