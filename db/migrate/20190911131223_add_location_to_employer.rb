class AddLocationToEmployer < ActiveRecord::Migration[5.1]
  def change
        add_column :employers, :location, :string
  end
end
