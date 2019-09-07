class Employer < ApplicationRecord
  # acts_as_token_authenticatable
  has_many :employer_images, dependent: :destroy
  accepts_nested_attributes_for :employer_images, allow_destroy: true

  def as_json(_opts = {})
    {
      email: email,
    }
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   def as_json(_opts = {})
   {
     id: id,
     first_name: first_name,
     last_name: last_name,
     email: email,
     bio: bio,
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
