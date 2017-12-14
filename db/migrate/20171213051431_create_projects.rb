class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :p_type
      t.text :description
      t.date :start_date
      t.date :end_date

      t.attachment :document

      t.timestamps
    end
  end
end
