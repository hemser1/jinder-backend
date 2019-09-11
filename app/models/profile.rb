class Profile < ApplicationRecord
  # acts_as_token_authenticatable
  belongs_to :user

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  def as_json(_opts = {})
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      user_id: user_id,
      industry: industry,
      skills: skills,
      user_bio: user_bio,
      location: loaction,
      personality: personality,
      user: user,
      image_photos: images.map do |x|
        {
          url: x.photo.url,
          name: x.photo_file_name,
          id: x.id
        }
      end
    }
  end
end
