class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.string :name
      t.text :description
      t.string :user_ids

      t.timestamps
    end
  end
end
