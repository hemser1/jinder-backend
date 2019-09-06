class Employer < ApplicationRecord
  acts_as_token_authenticatable

  def as_json(_opts = {})
    {
      email: email,
    }
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
