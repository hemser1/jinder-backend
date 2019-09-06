class AddAcceptedAndrejectedEmployersToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :accepted_employers, :text, array: true, default: []
    add_column :users, :rejected_employers, :text, array: true, default: []
  end
end
