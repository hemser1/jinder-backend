class EmployersController < Devise::RegistrationsController

  def create
    @employer = Employer.new(employers_params)

    if @employer.save!
      render json: @employer.as_json(only: [:email, :authentication_token, :id]), status: :created
    else
      head(:unprocessable_entity)
    end
  end

  def index
    @employers = Employer.all
    render json: @employers.as_json(include: [:employer_images])
  end

  def show
    @employer = Employer.find(params[:id])
    render json: @employer
  end

  def update_matches
    @employer = Employer.find_by_sql("
      SELECT employers.id, employers.accepted_profiles, employers.rejected_profiles
      FROM employers
      WHERE id = #{params[:id]}")
      current_accepted_profiles = @employer[0].accepted_profiles
      current_rejected_profiles = @employer[0].rejected_profiles
      updated_accepted_profiles = current_accepted_profiles.push(params[:accepted_profiles])
      updated_rejected_profiles = current_rejected_profiles.push(params[:rejected_profiles])

    Employer.update(
      params[:id],
      :accepted_profiles => updated_accepted_profiles,
      :rejected_profiles => updated_rejected_profiles)
      head(:created)
  end

  def show_matches
    @employers = Employer.find_by_sql("
      select *, e.id
      from users, (select unnest(employers.accepted_profiles)
      as user_id , employers.id from employers) e
      where users.id=e.user_id::INTEGER")
        render json: @employers.as_json(only: [:email])
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
    params.require(:employer).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :location,
      :company_name,
      :bio,
      :company_url,
      employer_images_attributes: %I[
        id
        photo
      ]
    )
  end
end
