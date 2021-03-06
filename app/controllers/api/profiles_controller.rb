class Api::ProfilesController < ApplicationController
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      render json: @profile, status: :created
    else
      head(:unprocessable_entity)
    end
  end

  def show
    @profile = Profile.where(user_id: params[:id])
    render json: @profile
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
          :user_bio,
          :industry,
          :location,
          :skills,
          :personality,
          images_attributes: %I[
            id
            photo
          ]
        # ]
      )
    end
end
