class AddTimetableTypeToTimetables < ActiveRecord::Migration[7.2]
  def change
    add_column :timetables, :timetable_type, :string
  end
end
