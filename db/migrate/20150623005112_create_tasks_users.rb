class CreateTasksUsers < ActiveRecord::Migration
  def change
    create_table :tasks_users, id: false do |t|
      t.references :task, index: true, null: false
      t.references :user, index: true, null: false
    end
  end
end
