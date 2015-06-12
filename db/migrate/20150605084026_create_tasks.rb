class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :description
      t.date :deadline

      t.timestamps
    end
  end
end
