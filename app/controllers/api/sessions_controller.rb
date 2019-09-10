class Api::SessionsController < ApplicationController
  def show
    current_user ? head(:ok) : head(:unauthorized)
  end

  def create
      user = User.where(email: params[:email]).first
      if user.nil?
        user = Employer.where(email: params[:email]).first
      end
    if user&.valid_password?(params[:password])
      render json: user.as_json(only: [:email, :authentication_token, :id]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json: {:success => true, id: nil }.to_json, status: :200
  #   current_user&.authentication_token = nil
  #   if current_user.save
  #     head(:ok)
  #   else
  #     head(:unauthorized)
  #   end
  # end
end

end
