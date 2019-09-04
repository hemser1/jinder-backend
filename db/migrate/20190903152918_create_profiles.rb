class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :user, index: true
      t.string :industry
      t.string :skills
      t.timestamps
    end
  end
end
