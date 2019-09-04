class UsersController < Devise::RegistrationsController

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user.as_json(only: [:email, :authentication_token]), status: :created
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

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
