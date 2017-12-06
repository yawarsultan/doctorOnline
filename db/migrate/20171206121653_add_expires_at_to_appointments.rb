class AddExpiresAtToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :expires_at, :datetime
  end
end
