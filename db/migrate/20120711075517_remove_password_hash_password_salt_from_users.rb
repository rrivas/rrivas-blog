class RemovePasswordHashPasswordSaltFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password_hash
    remove_column :users, :password_salt 
  end
end
