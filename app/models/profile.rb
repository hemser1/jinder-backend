class Profile < ApplicationRecord
  acts_as_token_authenticatable
  belongs_to :user
end
