class CreateTimetables < ActiveRecord::Migration[7.2]
  def change
    create_table :timetables do |t|
      t.string :title
      t.string :type
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
