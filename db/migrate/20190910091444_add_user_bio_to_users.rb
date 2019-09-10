class AddUserBioToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_bio, :string 
  end
end
