class AddAuthenticateTimeoutableToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_access_at, :datetime, default: nil
  end
end
