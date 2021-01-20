class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!(user_params(params))

    output = UserSerializer.new(user)

    render json: output
  end

  def user_params(params)
    out_params = params.permit('email', 'password', 'password_confirmation')

    out_params[:api_key] = SecureRandom.urlsafe_base64(32)

    out_params
  end
end
