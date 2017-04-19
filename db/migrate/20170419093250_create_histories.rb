class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.string :firstname
      t.string :lastname
      t.string :age
      t.datetime :date
      t.string :reason
      t.integer :user_id
      t.timestamps
    end
  end
end
