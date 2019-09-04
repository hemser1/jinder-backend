class CreateEmployers < ActiveRecord::Migration[5.1]
  def change
    create_table :employers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :bio
      t.string :company_url
      t.text  :accepted_profiles, array: true, default: []
      t.text  :rejected_profiles, array: true, default: []
      t.timestamps
    end
  end
end
