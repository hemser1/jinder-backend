class AddUserBioToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :user_bio, :string
    remove_column :users, :user_bio, :string
    rename_column :employers, :company_nane, :company_name
  end
end
