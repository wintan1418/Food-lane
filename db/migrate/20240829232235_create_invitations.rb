class CreateInvitations < ActiveRecord::Migration[7.2]
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :token
      t.references :user, null: false, foreign_key: true
      t.references :timetable, null: false, foreign_key: true

      t.timestamps
    end
  end
end
