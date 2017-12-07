class AddSpecialToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :special, :string
  end
end
