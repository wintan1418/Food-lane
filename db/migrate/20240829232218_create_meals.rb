class CreateMeals < ActiveRecord::Migration[7.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :recipe
      t.references :timetable, null: false, foreign_key: true

      t.timestamps
    end
  end
end
