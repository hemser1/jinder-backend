class AddAttachmentPhotoToEmployerImages < ActiveRecord::Migration[5.1]
  def self.up
    change_table :employer_images do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :employer_images, :photo
  end
end
