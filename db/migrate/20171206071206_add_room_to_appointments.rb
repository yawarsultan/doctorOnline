class AddRoomToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :room, :string
  end
end
