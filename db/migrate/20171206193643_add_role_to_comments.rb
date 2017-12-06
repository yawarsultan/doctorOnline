class AddRoleToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :role, :string
  end
end
