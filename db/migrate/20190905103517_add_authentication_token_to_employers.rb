class AddAuthenticationTokenToEmployers < ActiveRecord::Migration[5.1]
  def change
    add_column :employers, :authentication_token, :string, limit: 30
    add_index :employers, :authentication_token, unique: true

  end
end
