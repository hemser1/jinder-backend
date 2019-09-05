class EmployersController < Devise::RegistrationsController

  def create
    @employer = Employer.new(employers_params)

    if @employer.save!
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

  def employers_params
    params.require(:employer).permit(:first_name, :last_name, :email, :password, :bio, :company_url)
  end
end
