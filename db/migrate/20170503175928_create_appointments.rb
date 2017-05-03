class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_time
      t.integer :duration, limit: 4
      t.integer :user_id
      t.timestamps
    end
  end
end
