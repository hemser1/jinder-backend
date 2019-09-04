class EmployerController < ApplicationController
  def create
    @employer = Employer.new(employer_params)

    if @employer.save
      render json: @employer.as_json(only: [:email, :authentication_token, :id]), status: :created
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    @employer = Employer.where(id: params[:id]).first
    if @employer.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def employer_params
    params.require(:employer).permit(:first_name, :last_name, :email, :password, :bio, :company_url, :accepted_profiles, :rejected_profiles)
  end
end
