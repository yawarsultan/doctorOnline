class CreateMedicines < ActiveRecord::Migration[5.0]
  def change
    create_table :medicines do |t|
    t.string :name
    t.string :weight
    t.string :price 
      t.timestamps
    end
  end
end
