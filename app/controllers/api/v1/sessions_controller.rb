class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if !user.nil? && user.authenticate(params[:password])
      output = UserSerializer.new(user)

      render json: output
    else
      output = {
        error: 'Bad credentials'
      }
      render json: output, status: 400
    end
  end
end
