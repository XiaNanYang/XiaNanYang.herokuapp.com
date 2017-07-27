class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.references :activity, foreign_key: true
      t.references :place, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :description

      t.timestamps
    end
    add_index :schedules, :start_date
    add_index :schedules, :end_date
  end
end
