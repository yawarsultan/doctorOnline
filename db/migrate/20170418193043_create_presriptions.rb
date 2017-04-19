class CreatePresriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :presriptions do |t|
      t.string :disease
      t.string :drug_name
      t.string :quantity
      t.integer :user_id

      t.timestamps
    end
  end
end
