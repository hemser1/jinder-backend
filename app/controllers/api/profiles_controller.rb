class Api::ProfilesController < ApplicationController
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      render :create
    else
      head(:unprocessable_entity)
    end
  end

  def index
    @profiles = Profile.all
    render json: @profiles
  end

  private

    def profile_params
      params.require(:profile).permit(
        # [
          :first_name,
          :last_name,
          :user_id,
          :industry,
          :skills,
          images_attributes: %I[
            id
            photo
          ]
        # ]
      )
    end
end
