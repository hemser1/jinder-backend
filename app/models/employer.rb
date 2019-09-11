class Employer < ApplicationRecord
  has_many :employer_images, dependent: :destroy
  accepts_nested_attributes_for :employer_images, allow_destroy: true

  def as_json(_opts = {})
    {
      email: email,
    }
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   def as_json(_opts = {})
   {
     id: id,
     first_name: first_name,
     last_name: last_name,
     email: email,
     bio: bio,
     location: location,
     company_url: company_url,
     accepted_profiles: accepted_profiles,
     rejected_profiles: rejected_profiles,
     image_photos: employer_images.map do |x|
       {
         url: x.photo.url,
         name: x.photo_file_name,
         id: x.id
       }
     end
   }
 end
end
