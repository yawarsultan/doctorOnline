class AddTotalOnlineTimeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :total_online_time, :Float
  end
end
