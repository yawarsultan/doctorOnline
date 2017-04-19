class AddColumnsToPresription < ActiveRecord::Migration[5.0]
  def change
    add_column :presriptions, :age, :string
    add_column :presriptions, :name, :string
  end
end
