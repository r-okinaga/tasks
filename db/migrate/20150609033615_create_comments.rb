class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :task_id
      t.date :times

      t.timestamps
    end
  end
end
