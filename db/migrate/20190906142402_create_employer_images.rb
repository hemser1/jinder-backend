class CreateEmployerImages < ActiveRecord::Migration[5.1]
  def change
    create_table :employer_images do |t|
      t.integer :employer_id

      t.timestamps
    end
  end
end
