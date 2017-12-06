class AddDescriptionToMedicines < ActiveRecord::Migration[5.0]
  def change
    add_column :medicines, :description, :string
  end
end
