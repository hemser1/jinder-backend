class UsersController < Devise::RegistrationsController

  def show_matches
    @users = User.find_by_sql("
      select *, e.id
      from employers, (select unnest(users.accepted_employers)
      as employer_id, users.id from users) e
      where employers.id=e.employer_id::INTEGER")
        render json: @users.as_json(only: [:email])
  end

  def update_matches
    @user = User.find_by_sql("
      SELECT users.id, users.accepted_employers, users.rejected_employers
      FROM users
      WHERE id = #{params[:id]}")
      current_accepted_employers = @user[0].accepted_employers
      current_rejected_employers = @user[0].rejected_employers
      updated_accepted_employers = current_accepted_employers.push(params[:accepted_employers])
      updated_rejected_employers = current_rejected_employers.push(params[:rejected_employers])

    User.update(
      params[:id],
      :accepted_employers => updated_accepted_employers,
      :rejected_employers => updated_rejected_employers)
      head(:created)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user.as_json(only: [:email, :authentication_token, :id]), status: :created
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    @user = User.where(id: params[:id]).first
    if @user.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :accepted_profiles, :rejected_profiles)
  end
end
