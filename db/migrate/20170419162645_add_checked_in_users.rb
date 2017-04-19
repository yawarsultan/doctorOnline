class AddCheckedInUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :checked, :integer, default: "0"
  end
end
