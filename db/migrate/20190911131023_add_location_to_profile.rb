class AddLocationToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :location, :string
  end
end
