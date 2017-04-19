class AddDateToPresription < ActiveRecord::Migration[5.0]
  def change
    add_column :presriptions, :date, :datetime
  end
end
