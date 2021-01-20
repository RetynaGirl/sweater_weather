class Api::V1::UsersController < ApplicationController
  def create
    begin
      user = User.create!(user_params(params))
    rescue ActiveRecord::RecordInvalid => e
      if e.message.include? 'Email has already been taken'
        output = {
          error: 'Email has already been taken'
        }

      elsif e.message.include? 'Api key has already been taken'
        retry
      end
    else
      output = UserSerializer.new(user)
    end

    render json: output
  end

  def user_params(params)
    out_params = params.permit('email', 'password', 'password_confirmation')

    out_params[:api_key] = SecureRandom.urlsafe_base64(32)

    out_params
  end
end
