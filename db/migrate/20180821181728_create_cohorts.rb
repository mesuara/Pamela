class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :instructor_id
      t.integer :class_id
      t.timestamps
    end
  end
end
