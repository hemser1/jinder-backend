class AddAcceptedAndrejectedProfilesToEmployers < ActiveRecord::Migration[5.1]
  def change
    add_column :employers, :accepted_profiles, :text, array: true, default: []
    add_column :employers, :rejected_profiles, :text, array: true, default: []
  end
end
