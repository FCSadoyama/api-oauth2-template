class AddProviderAndUidToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_index :users, :uid, unique: true
    add_index :users, %i[provider uid]
    add_index :users, :email
  end
end
