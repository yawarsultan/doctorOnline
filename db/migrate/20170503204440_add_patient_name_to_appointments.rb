class AddPatientNameToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :patient_name, :string
  end
end
