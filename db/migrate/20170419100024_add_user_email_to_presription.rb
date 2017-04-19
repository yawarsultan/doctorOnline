class AddUserEmailToPresription < ActiveRecord::Migration[5.0]
  def change
    add_column :presriptions, :user_email, :string
  end
end
